import 'dart:developer' as developer;

import 'package:SisKa/models/profile.dart';
import 'package:SisKa/models/prodi.dart';
import 'package:SisKa/models/news.dart';
import 'package:SisKa/models/jadwal.dart';
import 'package:SisKa/models/approveReg.dart';
import 'package:SisKa/models/Notif.dart';
import 'package:SisKa/models/penelitian.dart';
import 'package:SisKa/models/timelineModel.dart';
import 'package:SisKa/models/notifUnread.dart';
import 'package:SisKa/models/registrasiNew.dart';
import 'package:SisKa/models/masaStudi.dart';
import 'package:SisKa/models/masaStudiCount.dart';
import 'package:SisKa/models/userAll.dart';
import 'package:SisKa/views/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class ApiService {
//final String baseUrl = "https://siskangv6.project-symphony.com";
//final String baseUrl = "http://194.31.53.130/siska_api/index.php";
  final String baseUrl = "siska-ng.tech";

  Client client = http.Client();

  Future<bool> login(var data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    developer.log("try login");
    try {
      final response =
          await client.post(Uri.http(baseUrl, "Siska_api/login"), body: data);

      developer.log("response: ${response.body}");
      var body = response.body.trim();
      if (body == "null") {
        return false;
      } else {
        developer.log("log response body: ${body}");
        print("print response body: ${body}");
        Map<String, dynamic> user = jsonDecode(body);
        final jabatan = '${user["jabatan"]}';
        if (jabatan == '1') {
          prefs.setString('IsAdmin', '1');
        } else {
          prefs.setString('IsAdmin', '0');
        }
        final namaus = prefs.setString('Nama', '${user['Nama']}!');
        print(namaus);
        prefs.setString('Nama', '${user['Nama']}');
        prefs.setString('Nim', '${user['Nim']}');
        prefs.setString('Id_prodi', '${user['Id_prodi']}');
        prefs.setString('Kode_prodi', '${user['Kode_prodi']}');
        prefs.setString('Email', '${user['Email']}');
        prefs.setString('Foto', '${user['Foto']}');
        prefs.setString('Username', '${user['Username']}');
        prefs.setString('Password', '${user['Password']}');
        prefs.setString('PasswordPlain', '${user['Passwordplain']}');
        prefs.setString('Nim_Nama', '${user['Nim_Nama']}');
        prefs.setString('Jabatan', '${user['jabatan']}');
        return true;
      }
    } finally {
      client.close();
    }
  }

  Future<bool> loginSa(var data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/login_superadmin"), body: data);
    if (response.body == "null") {
      return false;
    } else {
      await prefs.clear();
      Map<String, dynamic> user = jsonDecode(response.body);
      final nama = '${user['Nama']}!';
      print(nama);
      final namaus = prefs.setString('Nama', '${user['Nama']}!');
      print(namaus);
      prefs.setString('Nama', '${user['Nama']}');
      prefs.setString('Nim', '${user['Nim']}');
      prefs.setString('Id_prodi', '${user['Id_prodi']}');
      prefs.setString('Kode_prodi', '${user['Kode_prodi']}');
      prefs.setString('Email', '${user['Email']}');
      prefs.setString('Foto', '${user['Foto']}');
      prefs.setString('Username', '${user['Username']}');
      prefs.setString('Password', '${user['Password']}');
      prefs.setString('PasswordPlain', '${user['Passwordplain']}');
      prefs.setString('Nim_Nama', '${user['Nim_Nama']}');
      prefs.setString('Jabatan', '${user['jabatan']}');
      prefs.setString('IsAdmin', '1');
      return true;
    }
  }

  Future<String> register(File imageFile, var data) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // var stream  = new http.ByteStream(imageFile.openRead()); stream.cast();
    var length = await imageFile.length();
    var uri = Uri.http(baseUrl, "Siska_api/upload_foto");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));
    request.files.add(multipartFile);
    var response = await request.send();
    final respStr = await response.stream.bytesToString();

    Map<String, dynamic> user = data;
    final dataAdd = {
      'id_prodi': '${user['Kode_prodi']}',
      'angkatan': '${user['angkatan']}',
      'nama': '${user['nama']}',
      'email': '${user['email']}',
      'nim': '${user['nim']}',
      'password': '${user['password']}',
      'foto': respStr,
    };

    final responseAdd = await client
        .post(Uri.http(baseUrl, "Siska_api/registerAddDB"), body: dataAdd);
    String status = jsonDecode(responseAdd.body);
    return status;
  }

  Future<List<Profile>> getProfiles() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'username': prefs.getString('Username'),
      'password': prefs.getString('PasswordPlain')
    };
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/login_profile"), body: data);
    if (response.statusCode == 200) {
      client.close();
      return profileFromJson(response.body);
    } else {
      client.close();
      return null;
    }
  }

  Future<bool> getAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('Nama');
    if (id != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> approveDB(String id, String status) async {
    var client = new http.Client();
    final data = {'id': id, 'status': status};
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/ApproveregisterAddDB"), body: data);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getAuthJab() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jab = prefs.getString('Jabatan');
    return jab;
  }

  Future<bool> logOut() async {
    var client = new http.Client();
    final prefs = await SharedPreferences.getInstance();
    final data = {
      'jabatan': prefs.getString('Jabatan'),
      'nim': prefs.getString('Nim'),
      'token': 'LogOut'
    };
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/token_update"), body: data);
    if (response.statusCode == 200) {
      await prefs.clear();
      client.close();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deletePesan(String idDetil) async {
    var client = new http.Client();
    final prefs = await SharedPreferences.getInstance();
    final data = {'id_detil': idDetil};
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/delete_pesan"), body: data);
    if (response.statusCode == 200) {
      // await prefs.clear();
      client.close();
      return true;
    } else {
      return false;
    }
  }

  Future<List<UserAll>> getUserAll(String jabatan) async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String idProdi = prefs.getString('Id_prodi');
    if (idProdi != null) {
      final data = {
        'id_prodi': prefs.getString('Id_prodi'),
        'jabatan': jabatan
      };
      final response = await client
          .post(Uri.http(baseUrl, "Siska_api/get_user_all"), body: data);
      if (response.statusCode == 200) {
        //
        if (response.body == "0") {
          return [];
        } else {
          return userAllFromJson(response.body);
        }
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<ApproveReg>> getApproveReg() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String idProdi = prefs.getString('Id_prodi');
    if (idProdi != null) {
      final data = {'id_prodi': prefs.getString('Id_prodi')};
      final response = await client.post(
          Uri.http(baseUrl, "Siska_api/get_registrasi_by_prodi"),
          body: data);
      String tes = response.body.replaceAll(" ", "");
      print(tes);
      if (response.statusCode == 200) {
        //
        if (response.body == "0") {
          return [];
        } else {
          return approveRegFromJson(response.body);
        }
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<Prodi>> getProdi() async {
    final data = {'Aktif': 'Aktif'};
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/get_prodi_all"), body: data);
    if (response.statusCode == 200) {
      return prodiFromJson(response.body.trim());
    } else {
      return null;
    }
  }

  Future<bool> createProfile(Profile data) async {
    final response = await client.post(
      Uri.http(baseUrl, "api/profile"),
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(Profile data) async {
    final response = await client.put(
      Uri.http(baseUrl, "api/profile/${data.id}"),
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProfile(int id) async {
    final response = await client.delete(
      Uri.http(baseUrl, "api/profile/$id"),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<News>> getNews() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {'id_prodi': prefs.getString('Id_prodi')};
    final response =
        await client.post(Uri.http(baseUrl, "Siska_api/getNews"), body: data);
    print(response.body);
    if (response.statusCode == 200) {
      client.close();
      if (response.body == "0") {
        return [];
      } else {
        return newsFromJson(response.body);
      }
    } else {
      return null;
    }
  }

  Future<List<Penelitian>> getPenelitian() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
      'nim': prefs.getString('Nim'),
    };
    final response = await client.post(
        Uri.http(baseUrl, "Siska_api/get_timeline_penelitian"),
        body: data);
    print(response.body);
    if (response.statusCode == 200) {
      client.close();
      if (response.body == "0") {
        return [];
      } else {
        return penelitianFromJson(response.body);
      }
    } else {
      return null;
    }
  }

  Future<List<TimelineModelData>> getTimeline(String idPen) async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String nim = "-";
    if (idPen == "Mhs") {
      nim = prefs.getString('Nim');
    } else {
      nim = idPen;
    }
    final data = {'nim': nim};
    final response = await client.post(
        Uri.http(baseUrl, "Siska_api/get_timeline_penelitian_by_nim"),
        body: data);
    print(response.body);
    if (response.statusCode == 200) {
      client.close();
      return timelineFromJson(response.body.trim());
    } else {
      return null;
    }
  }

  Future<List<Jadwal>> getJadwal() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
      'nim': prefs.getString('Nim'),
    };
    final response =
        await client.post(Uri.http(baseUrl, "Siska_api/getJadwal"), body: data);

    print(response.body);
    if (response.statusCode == 200) {
      client.close();
      if (response.body == "0") {
        return [];
      } else {
        return jadwalFromJson(response.body);
      }
    } else {
      return null;
    }
  }

  Future<bool> updateToken(String token) async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'jabatan': prefs.getString('Jabatan'),
      'nim': prefs.getString('Nim'),
      'token': token
    };
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/token_update"), body: data);
    print(response.body);
    if (response.statusCode == 200) {
      client.close();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateread(String idPesan) async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {'nim': prefs.getString('Nim'), 'id_pesan': idPesan};
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/read_pesan"), body: data);
    if (response.statusCode == 200) {
      client.close();
      return true;
    } else {
      return false;
    }
  }

  Future<List<Notif>> getNotif() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String idProdi = prefs.getString('Id_prodi');
    if (idProdi != null) {
      final data = {
        'id_prodi': prefs.getString('Id_prodi'),
        'nim': prefs.getString('Nim'),
      };
      final response = await client
          .post(Uri.http(baseUrl, "Siska_api/get_notif_penerima"), body: data);
      if (response.statusCode == 200) {
        client.close();
        if (response.body == "0") {
          return [];
        } else {
          return notifFromJson(response.body);
        }
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<MasaStudi>> getMasaStudi() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
      'nim': prefs.getString('Nim'),
      'jabatan': prefs.getString('Jabatan')
    };
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/get_masa_studi"), body: data);
    if (response.statusCode == 200) {
      client.close();
      return masaStudiFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<MasaStudiCount>> getMasaStudiCount() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
      'nim': prefs.getString('Nim'),
      'jabatan': prefs.getString('Jabatan')
    };
    final response = await client.post(
        Uri.http(baseUrl, "Siska_api/get_masa_studi_dosen_count"),
        body: data);
    if (response.statusCode == 200) {
      client.close();
      return masaStudiCountFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<NorifUnread>> getNotifUnread() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'nim': prefs.getString('Nim'),
    };
    final response = await client.post(
        Uri.http(baseUrl, "Siska_api/get_notif_penerima_unread"),
        body: data);
    if (response.statusCode == 200) {
      client.close();
      return norifUnreadFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<RegistrasiNew>> getRegistrasiNew() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'nim': prefs.getString('Nim'),
    };
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/get_registrasi_new"), body: data);
    if (response.statusCode == 200) {
      client.close();
      return registrasiNewFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Pengajuan>> getDashPengajuan() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
    };
    final response = await client.post(
        Uri.http(baseUrl, "Siska_api/get_mhs_pengajuan_by_angkatan"),
        body: data);
    if (response.statusCode == 200) {
      client.close();
      return pengajuanFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<PenelitianDash>> getDashProposal() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
    };
    final response = await client.post(
        Uri.http(baseUrl, "Siska_api/get_mhs_proposal_by_angkatan"),
        body: data);
    if (response.statusCode == 200) {
      client.close();
      return penelitianDashFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<PenelitianDash>> getDashPratesis() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
    };
    final response = await client.post(
        Uri.http(baseUrl, "Siska_api/get_mhs_pratesis_by_angkatan"),
        body: data);
    if (response.statusCode == 200) {
      client.close();
      return penelitianDashFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<PenelitianDash>> getDashTesis() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
    };
    final response = await client.post(
        Uri.http(baseUrl, "Siska_api/get_mhs_tesis_by_angkatan"),
        body: data);
    if (response.statusCode == 200) {
      client.close();
      return penelitianDashFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<MhsDash>> getDashMhsAktif() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
    };
    final response = await client.post(
        Uri.http(baseUrl, "Siska_api/get_mhs_aktif_by_angkatan"),
        body: data);
    if (response.statusCode == 200) {
      client.close();
      return mhsDashFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<MhsDash>> getDashMhsNonAktif() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
    };
    final response = await client.post(
        Uri.http(baseUrl, "Siska_api/get_mhs_tidakaktif_by_angkatan"),
        body: data);
    if (response.statusCode == 200) {
      client.close();
      return mhsDashFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Topik>> getDashTopik() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
    };
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/get_topik_penelitian"), body: data);
    if (response.statusCode == 200) {
      client.close();
      return topikFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<PembimbingDash>> getDashPembimbing() async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
    };
    final response = await client.post(
        Uri.http(baseUrl, "Siska_api/get_total_pembimbing_1"),
        body: data);
    if (response.statusCode == 200) {
      client.close();
      return pembimbingFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> notifSend(String judul, String isi, String kriteria) async {
    var client = new http.Client();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = {
      'id_prodi': prefs.getString('Id_prodi'),
      'id_admin': prefs.getString('Nim'),
      'judul': judul,
      'isi': isi,
      'kriteria': kriteria
    };
    final response = await client
        .post(Uri.http(baseUrl, "Siska_api/kirim_pesan"), body: data);
    if (response.statusCode == 200) {
      client.close();
      return true;
    } else {
      return false;
    }
  }

  Future<String> settingProfile(File imageFile, var data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> user = data;
    if (imageFile != null) {
      var stream =
          new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      // var stream  = new http.ByteStream(imageFile.openRead()); stream.cast();
      var length = await imageFile.length();
      var uri = Uri.http(baseUrl, "Siska_api/upload_foto");
      var request = new http.MultipartRequest("POST", uri);
      var multipartFile = new http.MultipartFile('file', stream, length,
          filename: basename(imageFile.path));
      request.files.add(multipartFile);
      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      final dataAdd = {
        'jabatan': prefs.getString('Jabatan'),
        'nim': prefs.getString('Nim'),
        'password': '${user['password']}',
        'no_telp': '${user['no_telp']}',
        'foto': respStr,
      };
      final responseAdd = await client.post(
          Uri.http(baseUrl, "Siska_api/settingProfileAddDB"),
          body: dataAdd);
      String status = jsonDecode(responseAdd.body);
      return status;
    } else {
      final respStr = '${user['foto']}';
      final dataAdd = {
        'jabatan': prefs.getString('Jabatan'),
        'nim': prefs.getString('Nim'),
        'password': '${user['password']}',
        'no_telp': '${user['no_telp']}',
        'foto': respStr,
      };
      final responseAdd = await client.post(
          Uri.http(baseUrl, "Siska_api/settingProfileAddDB"),
          body: dataAdd);
      String status = jsonDecode(responseAdd.body);
      return status;
    }
  }
}

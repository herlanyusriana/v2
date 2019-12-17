import 'package:flutter_cipher/flutter_cipher.dart';
import 'package:pointycastle/padded_block_cipher/padded_block_cipher_impl.dart';
import 'package:steel_crypt/PointyCastleN/api.dart';

class MCrypt
{
    String iv = "cnplussystem";
    ParametersWithIV ivspec;
    SecretKeySpec keyspec;
    Cipher cipher;
    String SecretKey = "cnplussystem";

    MCrypt()
    {
        ivspec = new ParametersWithIV(iv.getBytes());
        keyspec = new SecretKeySpec(SecretKey.getBytes(), "AES");
        try {
            cipher = Cipher.getInstance("AES/CBC/NoPadding");
        } on NoSuchAlgorithmException catch (e) {
            e.printStackTrace();
        } on NoSuchPaddingException catch (e) {
            e.printStackTrace();
        }
    }

    List<int> encrypt(String prefix, String text)
    {
        if ((text == null) || (text.length == 0)) {
            throw new Exception("Empty string");
        }
        List<int> encrypted = null;
        try {
            iv = (prefix + iv);
            iv = iv.substring(0, 16);
            SecretKey = (prefix + SecretKey);
            SecretKey = SecretKey.substring(0, 16);
            ivspec = new IvParameterSpec(iv.getBytes());
            keyspec = new SecretKeySpec(SecretKey.getBytes(), "AES");
            cipher.init(Cipher_.ENCRYPT_MODE, keyspec, ivspec);
            encrypted = cipher.doFinal(padString(text).getBytes());
        } on Exception catch (e) {
            throw new Exception("[encrypt] " + e.getMessage());
        }
        return encrypted;
    }

    List<int> decrypt(String prefix, String code)
    {
        if ((code == null) || (code.length == 0)) {
            throw new Exception("Empty string");
        }
        List<int> decrypted = null;
        try {
            iv = (prefix + iv);
            iv = iv.substring(0, 16);
            SecretKey = (prefix + SecretKey);
            SecretKey = SecretKey.substring(0, 16);
            cipher.init(Cipher_.DECRYPT_MODE, keyspec, ivspec);
            decrypted = cipher.doFinal(hexToBytes(code));
        } on Exception catch (e) {
            throw new Exception("[decrypt] " + e.getMessage());
        }
        return decrypted;
    }

    static String bytesToHex(List<int> data)
    {
        if (data == null) {
            return null;
        }
        int len = data.length;
        String str = "";
        for (int i = 0; i < len; i++) {
            if ((data[i] & 15) < 16) {
                str = ((str + "0") + java.lang.Integer.toHexString(data[i] & 15));
            } else {
                str = (str + java.lang.Integer.toHexString(data[i] & 15));
            }
        }
        return str;
    }

    static List<int> hexToBytes(String str)
    {
        if (str == null) {
            return null;
        } else {
            if (str.length < 2) {
                return null;
            } else {
                int len = (str.length ~/ 2);
                List<int> buffer = new List<int>(len);
                for (int i = 0; i < len; i++) {
                    buffer[i] = Integer.parseInt(str.substring(i * 2, (i * 2) + 2), 16);
                }
                return buffer;
            }
        }
    }

    static String padString(String source)
    {
        int paddingChar = 0;
        int size = 16;
        int x = (source.length % size);
        int padLength = (size - x);
        for (int i = 0; i < padLength; i++) {
            source += paddingChar;
        }
        return source;
    }
}
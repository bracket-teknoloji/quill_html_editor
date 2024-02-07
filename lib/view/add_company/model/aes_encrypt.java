public  String AesEncrypt(String text) {
        try {
            if (TextUtils.isEmpty(text)) {
                return "";
            }
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            byte[] keyBytes = new byte[16];
            byte[] b = _getAesKey().getBytes("UTF-8");
            int len = b.length;
            if (len > keyBytes.length) {
                len = keyBytes.length;
            }
            System.arraycopy(b, 0, keyBytes, 0, len);
            SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
            IvParameterSpec ivSpec = new IvParameterSpec(keyBytes);
            cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivSpec);
            //
            byte[] results = cipher.doFinal(text.getBytes("UTF-8"));
            return Base64.encodeToString(results, Base64.NO_WRAP);
        } catch (Exception e) {
            return "";
        }
    }




    private  String _getAesKey() {
        return new Object() {
            int t;

            public String toString() {
                byte[] buf = new byte[61];
                t = -817074313;
                buf[0] = (byte) (t >>> 5);
                t = 504536449;
                buf[1] = (byte) (t >>> 9);
                t = -241918;
                buf[2] = (byte) (t >>> 13);
                t = -2053619;
                buf[3] = (byte) (t >>> 14);
                t = -343897;
                buf[4] = (byte) (t >>> 12);
                t = 1959542227;
                buf[5] = (byte) (t >>> 24);
                t = -1822352597;
                buf[6] = (byte) (t >>> 10);
                t = -61702648;
                buf[7] = (byte) (t >>> 21);
                t = -131138934;
                buf[8] = (byte) (t >>> 20);
                t = -43778766;
                buf[9] = (byte) (t >>> 19);
                t = -1218471685;
                buf[10] = (byte) (t >>> 6);
                t = -1169818100;
                buf[11] = (byte) (t >>> 23);
                t = 1394970807;
                buf[12] = (byte) (t >>> 6);
                t = 105700244;
                buf[13] = (byte) (t >>> 3);
                t = -207675268;
                buf[14] = (byte) (t >>> 7);
                t = 990694175;
                buf[15] = (byte) (t >>> 3);
                t = 1335555854;
                buf[16] = (byte) (t >>> 14);
                t = -940;
                buf[17] = (byte) (t >>> 5);
                t = -1024514;
                buf[18] = (byte) (t >>> 13);
                t = -170162;
                buf[19] = (byte) (t >>> 11);
                t = 839504750;
                buf[20] = (byte) (t >>> 10);
                t = 402403039;
                buf[21] = (byte) (t >>> 22);
                t = -2121385325;
                buf[22] = (byte) (t >>> 19);
                t = 91697754;
                buf[23] = (byte) (t >>> 8);
                t = 741561788;
                buf[24] = (byte) (t >>> 16);
                t = 1724206056;
                buf[25] = (byte) (t >>> 21);
                t = 1671651219;
                buf[26] = (byte) (t >>> 12);
                t = 437659142;
                buf[27] = (byte) (t >>> 23);
                t = 219829411;
                buf[28] = (byte) (t >>> 9);
                t = 1425737036;
                buf[29] = (byte) (t >>> 5);
                t = -869408486;
                buf[30] = (byte) (t >>> 16);
                t = -1037107022;
                buf[31] = (byte) (t >>> 16);
                t = 350289615;
                buf[32] = (byte) (t >>> 10);
                t = 2013583627;
                buf[33] = (byte) (t >>> 2);
                t = -1668771963;
                buf[34] = (byte) (t >>> 22);
                t = 570685603;
                buf[35] = (byte) (t >>> 19);
                t = -1704733839;
                buf[36] = (byte) (t >>> 16);
                t = -824735594;
                buf[37] = (byte) (t >>> 17);
                t = -14855;
                buf[38] = (byte) (t >>> 9);
                t = -256896;
                buf[39] = (byte) (t >>> 11);
                t = -42818;
                buf[40] = (byte) (t >>> 9);
                t = -640452821;
                buf[41] = (byte) (t >>> 18);
                t = -720900900;
                buf[42] = (byte) (t >>> 22);
                t = -937;
                buf[43] = (byte) (t >>> 5);
                t = -1050808720;
                buf[44] = (byte) (t >>> 23);
                t = -701528227;
                buf[45] = (byte) (t >>> 23);
                t = -1641635114;
                buf[46] = (byte) (t >>> 1);
                t = -815548650;
                buf[47] = (byte) (t >>> 7);
                t = -966389181;
                buf[48] = (byte) (t >>> 13);
                t = -604584708;
                buf[49] = (byte) (t >>> 12);
                t = 808109569;
                buf[50] = (byte) (t >>> 5);
                t = -912567662;
                buf[51] = (byte) (t >>> 11);
                t = -335226669;
                buf[52] = (byte) (t >>> 1);
                t = -1706076159;
                buf[53] = (byte) (t >>> 14);
                t = 1897990053;
                buf[54] = (byte) (t >>> 19);
                t = -527355389;
                buf[55] = (byte) (t >>> 11);
                t = -515617193;
                buf[56] = (byte) (t >>> 19);
                t = 449448516;
                buf[57] = (byte) (t >>> 6);
                t = -1611890403;
                buf[58] = (byte) (t >>> 23);
                t = -1516162058;
                buf[59] = (byte) (t >>> 4);
                t = -926598666;
                buf[60] = (byte) (t >>> 2);
                return new String(buf);
            }
        }.toString();
    }
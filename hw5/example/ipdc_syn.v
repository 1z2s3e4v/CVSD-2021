/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Mon Dec 20 21:42:03 2021
/////////////////////////////////////////////////////////////


module ipdc ( i_clk, i_rst_n, i_op_valid, i_op_mode, o_op_ready, i_in_valid, 
        i_in_data, o_in_ready, o_out_valid, o_out_data );
  input [3:0] i_op_mode;
  input [23:0] i_in_data;
  output [23:0] o_out_data;
  input i_clk, i_rst_n, i_op_valid, i_in_valid;
  output o_op_ready, o_in_ready, o_out_valid;
  wire   m_reg_r_1__7_, m_reg_r_1__6_, m_reg_r_1__4_, m_reg_r_1__3_,
         m_reg_r_1__2_, m_reg_r_1__1_, m_reg_r_1__0_, m_reg_r_2__7_,
         m_reg_r_2__6_, m_reg_r_2__5_, m_reg_r_2__4_, m_reg_r_2__3_,
         m_reg_r_2__2_, m_reg_r_2__1_, m_reg_r_2__0_, m_reg_r_3__7_,
         m_reg_r_3__6_, m_reg_r_3__5_, m_reg_r_3__4_, m_reg_r_3__3_,
         m_reg_r_3__2_, m_reg_r_3__1_, m_reg_r_3__0_, m_reg_r_4__7_,
         m_reg_r_4__6_, m_reg_r_4__5_, m_reg_r_4__4_, m_reg_r_4__3_,
         m_reg_r_4__2_, m_reg_r_4__1_, m_reg_r_4__0_, m_reg_g_1__7_,
         m_reg_g_1__6_, m_reg_g_1__4_, m_reg_g_1__3_, m_reg_g_1__2_,
         m_reg_g_1__1_, m_reg_g_1__0_, m_reg_g_2__7_, m_reg_g_2__6_,
         m_reg_g_2__5_, m_reg_g_2__4_, m_reg_g_2__3_, m_reg_g_2__2_,
         m_reg_g_2__1_, m_reg_g_2__0_, m_reg_g_3__7_, m_reg_g_3__6_,
         m_reg_g_3__5_, m_reg_g_3__4_, m_reg_g_3__3_, m_reg_g_3__2_,
         m_reg_g_3__1_, m_reg_g_3__0_, m_reg_g_4__7_, m_reg_g_4__6_,
         m_reg_g_4__5_, m_reg_g_4__4_, m_reg_g_4__3_, m_reg_g_4__2_,
         m_reg_g_4__1_, m_reg_g_4__0_, m_reg_b_1__7_, m_reg_b_1__6_,
         m_reg_b_1__4_, m_reg_b_1__3_, m_reg_b_1__2_, m_reg_b_1__1_,
         m_reg_b_1__0_, m_reg_b_2__7_, m_reg_b_2__6_, m_reg_b_2__5_,
         m_reg_b_2__4_, m_reg_b_2__3_, m_reg_b_2__2_, m_reg_b_2__1_,
         m_reg_b_2__0_, m_reg_b_3__7_, m_reg_b_3__6_, m_reg_b_3__5_,
         m_reg_b_3__4_, m_reg_b_3__3_, m_reg_b_3__2_, m_reg_b_3__1_,
         m_reg_b_3__0_, m_reg_b_4__7_, m_reg_b_4__6_, m_reg_b_4__5_,
         m_reg_b_4__4_, m_reg_b_4__3_, m_reg_b_4__2_, m_reg_b_4__1_,
         m_reg_b_4__0_, counter_r_8_, ftr_zero_pad_w, valid_w, valid_r, N399,
         N400, N401, N402, N403, N404, N405, N406, N425, N426, N427, N428,
         N429, N430, N431, N433, N434, N435, N436, N437, N438, N439, N441,
         N442, N443, N444, N445, N446, N447, N448, N449, N450, N451, N452,
         N453, N454, N455, N456, N457, N458, N459, N460, N461, N462, N463,
         N464, N465, N466, N467, N468, N469, N470, N471, N531, N532, N533,
         N534, N535, N536, N537, N538, N539, N540, N599, N600, N601, N602,
         N603, N604, N605, N606, N607, N608, N609, N610, N611, N612, N613,
         N614, N615, N616, N617, N618, N619, N620, N621, N622, N623, N624,
         N625, N626, N627, N628, N629, N630, N707, N708, N709, N710, N711,
         N712, N713, N714, N715, N716, N717, N718, N719, N720, N721, N722,
         N723, N724, N725, N726, N727, N728, N729, N730, N731, N732, N733,
         N734, N735, N736, N737, N738, N815, N816, N817, N818, N819, N820,
         N821, N822, N823, N824, N825, N826, N827, N828, N829, N830, N831,
         N832, N833, N834, N835, N836, N837, N838, N839, N840, N841, N842,
         N843, N844, N845, N846, n739, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n786, DP_OP_284J1_122_4910_n165,
         DP_OP_284J1_122_4910_n150, DP_OP_307_134_2203_n256,
         DP_OP_307_134_2203_n209, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n8150, n8160, n8170, n8180, n8190,
         n8200, n8210, n8220, n8230, n8240, n8250, n8260, n8270, n8280, n8290,
         n8300, n8310, n8320, n8330, n8340, n8350, n8360, n8370, n8380, n8390,
         n8400, n8410, n8420, n8430, n8440, n8450, n8460, n847, n848, n849,
         n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860,
         n861, n862, n863, n864, n865, n866, n867, n868, n869, n870, n871,
         n872, n873, n874, n875, n876, n877, n878, n879, n880, n881, n882,
         n883, n884, n885, n886, n887, n888, n889, n890, n891, n892, n893,
         n894, n895, n896, n897, n898, n899, n900, n901, n902, n903, n904,
         n905, n906, n907, n908, n909, n910, n911, n912, n913, n914, n915,
         n916, n917, n918, n919, n920, n921, n922, n923, n924, n925, n926,
         n927, n928, n929, n930, n931, n932, n933, n934, n935, n936, n937,
         n938, n939, n940, n941, n942, n943, n944, n945, n946, n947, n948,
         n949, n950, n951, n952, n953, n954, n955, n956, n957, n958, n959,
         n960, n961, n962, n963, n964, n965, n966, n967, n968, n969, n970,
         n971, n972, n973, n974, n975, n976, n977, n978, n979, n980, n981,
         n982, n983, n984, n985, n986, n987, n988, n989, n990, n991, n992,
         n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
         n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033,
         n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043,
         n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053,
         n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063,
         n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073,
         n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083,
         n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093,
         n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103,
         n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113,
         n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123,
         n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133,
         n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143,
         n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153,
         n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163,
         n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173,
         n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183,
         n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193,
         n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203,
         n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213,
         n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223,
         n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233,
         n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243,
         n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253,
         n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
         n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273,
         n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283,
         n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293,
         n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303,
         n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313,
         n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323,
         n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333,
         n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343,
         n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1354, n1355,
         n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364, n1365,
         n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374, n1375,
         n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384, n1385,
         n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394, n1395,
         n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404, n1405,
         n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414, n1415,
         n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424, n1425,
         n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435,
         n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445,
         n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455,
         n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465,
         n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475,
         n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485,
         n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494, n1495,
         n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504, n1505,
         n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514, n1515,
         n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524, n1525,
         n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1535,
         n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544, n1545,
         n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554, n1555,
         n1556, n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564, n1565,
         n1566, n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574, n1575,
         n1576, n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584, n1585,
         n1586, n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1594, n1595,
         n1596, n1597, n1598, n1599, n1600, n1601, n1602, n1603, n1604, n1605,
         n1606, n1607, n1608, n1609, n1610, n1611, n1612, n1613, n1614, n1615,
         n1616, n1617, n1618, n1619, n1620, n1621, n1622, n1623, n1624, n1625,
         n1626, n1627, n1628, n1629, n1630, n1631, n1632, n1633, n1634, n1635,
         n1636, n1637, n1638, n1639, n1640, n1641, n1642, n1643, n1644, n1645,
         n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653, n1654, n1655,
         n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663, n1664, n1665,
         n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673, n1674, n1675,
         n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683, n1684, n1685,
         n1686, n1687, n1688, n1689, n1690, n1691, n1692, n1693, n1694, n1695,
         n1696, n1697, n1698, n1699, n1700, n1701, n1702, n1703, n1704, n1705,
         n1706, n1707, n1708, n1709, n1710, n1711, n1712, n1713, n1714, n1715,
         n1716, n1717, n1718, n1719, n1720, n1721, n1722, n1723, n1724, n1725,
         n1726, n1727, n1728, n1729, n1730, n1731, n1732, n1733, n1734, n1735,
         n1736, n1737, n1738, n1739, n1740, n1741, n1742, n1743, n1744, n1745,
         n1746, n1749, n1750, n1751, n1752, n1753, n1754, n1755, n1757, n1758,
         n1759, n1760, n1761, n1762, n1765, n1766, n1767, n1768, n1769, n1770,
         n1771, n1772, n1773, n1774, n1775, n1776, n1777, n1778, n1779, n1780,
         n1781, n1782, n1783, n1785, n1786, n1787, n1788, n1789, n1790, n1791,
         n1792, n1793, n1794, n1795, n1796, n1797, n1798, n1799, n1800, n1801,
         n1802, n1803, n1804, n1805, n1806, n1807, n1808, n1809, n1810, n1811,
         n1812, n1813, n1814, n1815, n1816, n1817, n1818, n1819, n1820, n1821,
         n1822, n1823, n1824, n1825, n1826, n1827, n1828, n1829, n1830, n1831,
         n1833, n1834, n1835, n1836, n1837, n1838, n1839, n1840, n1842, n1843,
         n1844, n1845, n1846, n1847, n1848, n1849, n1850, n1851, n1852, n1853,
         n1854, n1855, n1856, n1857, n1858, n1859, n1860, n1861, n1862, n1863,
         n1864, n1867, n1868, n1869, n1870, n1871, n1872, n1873, n1874, n1875,
         n1876, n1877, n1878, n1879, n1880, n1881, n1882, n1883, n1884, n1885,
         n1886, n1887, n1888, n1889, n1890, n1891, n1892, n1893, n1894, n1895,
         n1896, n1897, n1898, n1899, n1900, n1901, n1902, n1903, n1904, n1905,
         n1906, n1907, n1908, n1909, n1910, n1911, n1912, n1913, n1914, n1915,
         n1916, n1917, n1918, n1919, n1920, n1921, n1922, n1923, n1924, n1925,
         n1926, n1927, n1928, n1929, n1930, n1931, n1932, n1933, n1934, n1935,
         n1936, n1937, n1938, n1939, n1940, n1941, n1942, n1943, n1944, n1945,
         n1946, n1947, n1948, n1949, n1950, n1951, n1952, n1953, n1954, n1955,
         n1956, n1957, n1958, n1959, n1960, n1971, n1972, n1973, n1974, n1975,
         n1976, n1977, n1978, n1979, n1980, n1981, n1982, n1983, n1984, n1985,
         n1986, n1987, n1988, n1989, n1990, n1991, n1992, n1993, n1994, n1995,
         n1996, n1997, n1998, n1999, n2000, n2001, n2002, n2003, n2004, n2005,
         n2006, n2007, n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015,
         n2016, n2017, n2018, n2019, n2020, n2021, n2022, n2023, n2024, n2025,
         n2026, n2027, n2028, n2029, n2030, n2031, n2032, n2033, n2034, n2035,
         n2036, n2037, n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045,
         n2046, n2047, n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055,
         n2056, n2057, n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065,
         n2066, n2067, n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075,
         n2076, n2077, n2078, n2079, n2080, n2081, n2082, n2083, n2084, n2085,
         n2086, n2087, n2088, n2089, n2090, n2091, n2092, n2093, n2094, n2095,
         n2096, n2097, n2098, n2099, n2100, n2101, n2102, n2103, n2104, n2105,
         n2106, n2107, n2108, n2109, n2110, n2111, n2112, n2113, n2114, n2115,
         n2116, n2117, n2118, n2119, n2120, n2121, n2122, n2123, n2127, n2128,
         n2129, n2130, n2131, n2132, n2133;
  wire   [23:7] census;
  wire   [1:0] ftr_cnt;
  wire   [2:0] ftr_col;
  wire   [2:0] ftr_row;
  wire   [1:0] ftr_cnt2;
  wire   [23:0] img_data;
  wire   [23:0] median_out;
  wire   [3:0] cstate;
  wire   [23:0] out_data_r;
  wire   [7:0] img_pos;
  wire   [7:0] dsp_pos;
  wire   [4:0] img_size_r;
  wire   [7:0] mem_addr;
  wire   [23:0] out_data;

  sram_256x8 mem_mem3 ( .Q(img_data[7:0]), .A(mem_addr), .D(i_in_data[7:0]), 
        .CLK(i_clk), .CEN(1'b0), .WEN(n786) );
  sram_256x8 mem_mem2 ( .Q(img_data[15:8]), .A(mem_addr), .D(i_in_data[15:8]), 
        .CLK(i_clk), .CEN(1'b0), .WEN(n786) );
  sram_256x8 mem_mem1 ( .Q(img_data[23:16]), .A(mem_addr), .D(i_in_data[23:16]), .CLK(i_clk), .CEN(1'b0), .WEN(n786) );
  DFFRX1 img_origin_r_reg_0_ ( .D(N399), .CK(i_clk), .RN(n2114), .Q(img_pos[0]) );
  DFFRX4 img_size_r_reg_3_ ( .D(n766), .CK(i_clk), .RN(i_rst_n), .Q(
        img_size_r[3]), .QN(n1986) );
  DFFRX4 cstate_reg_0_ ( .D(n780), .CK(i_clk), .RN(i_rst_n), .Q(cstate[0]), 
        .QN(n2041) );
  DFFRX4 img_size_r_reg_2_ ( .D(n767), .CK(i_clk), .RN(i_rst_n), .Q(
        img_size_r[2]), .QN(n2044) );
  DFFRX1 img_size_r_reg_1_ ( .D(n768), .CK(i_clk), .RN(n2117), .Q(
        img_size_r[1]), .QN(n2022) );
  DFFRX1 img_size_r_reg_0_ ( .D(n769), .CK(i_clk), .RN(n2115), .Q(
        img_size_r[0]), .QN(n2086) );
  DFFRX1 img_origin_r_reg_3_ ( .D(N402), .CK(i_clk), .RN(n2110), .Q(img_pos[3]) );
  DFFRX1 img_origin_r_reg_4_ ( .D(N403), .CK(i_clk), .RN(n2110), .Q(img_pos[4]) );
  DFFRX1 img_origin_r_reg_5_ ( .D(N404), .CK(i_clk), .RN(n2110), .Q(img_pos[5]), .QN(n2053) );
  DFFRX1 img_origin_r_reg_6_ ( .D(N405), .CK(i_clk), .RN(n2110), .Q(img_pos[6]) );
  DFFRX1 counter_r_reg_2_ ( .D(n775), .CK(i_clk), .RN(n2110), .Q(n1984), .QN(
        n1987) );
  DFFRX1 counter_r_reg_4_ ( .D(n773), .CK(i_clk), .RN(n2110), .Q(dsp_pos[4]), 
        .QN(n2058) );
  DFFRX1 counter_r_reg_6_ ( .D(n771), .CK(i_clk), .RN(n2110), .Q(dsp_pos[6])
         );
  DFFRX1 counter_r_reg_7_ ( .D(n770), .CK(i_clk), .RN(n2110), .Q(dsp_pos[7]), 
        .QN(n2077) );
  DFFRX1 out_data_r_reg_0_ ( .D(out_data[0]), .CK(i_clk), .RN(n2110), .Q(
        out_data_r[0]) );
  DFFRX1 out_data_r_reg_1_ ( .D(out_data[1]), .CK(i_clk), .RN(n2110), .Q(
        out_data_r[1]) );
  DFFRX1 out_data_r_reg_2_ ( .D(out_data[2]), .CK(i_clk), .RN(n2110), .Q(
        out_data_r[2]) );
  DFFRX1 out_data_r_reg_3_ ( .D(out_data[3]), .CK(i_clk), .RN(n2110), .Q(
        out_data_r[3]) );
  DFFRX1 out_data_r_reg_4_ ( .D(out_data[4]), .CK(i_clk), .RN(n2111), .Q(
        out_data_r[4]) );
  DFFRX1 out_data_r_reg_6_ ( .D(out_data[6]), .CK(i_clk), .RN(n2112), .Q(
        out_data_r[6]) );
  DFFRX1 out_data_r_reg_8_ ( .D(out_data[8]), .CK(i_clk), .RN(n2119), .Q(
        out_data_r[8]) );
  DFFRX1 out_data_r_reg_9_ ( .D(out_data[9]), .CK(i_clk), .RN(n2120), .Q(
        out_data_r[9]) );
  DFFRX1 out_data_r_reg_10_ ( .D(out_data[10]), .CK(i_clk), .RN(n2110), .Q(
        out_data_r[10]) );
  DFFRX1 out_data_r_reg_11_ ( .D(out_data[11]), .CK(i_clk), .RN(n2116), .Q(
        out_data_r[11]) );
  DFFRX1 out_data_r_reg_12_ ( .D(out_data[12]), .CK(i_clk), .RN(n2115), .Q(
        out_data_r[12]) );
  DFFRX1 out_data_r_reg_13_ ( .D(out_data[13]), .CK(i_clk), .RN(n2117), .Q(
        out_data_r[13]) );
  DFFRX1 out_data_r_reg_14_ ( .D(out_data[14]), .CK(i_clk), .RN(n2114), .Q(
        out_data_r[14]) );
  DFFRX1 out_data_r_reg_15_ ( .D(out_data[15]), .CK(i_clk), .RN(n2113), .Q(
        out_data_r[15]) );
  DFFRX1 out_data_r_reg_16_ ( .D(out_data[16]), .CK(i_clk), .RN(n2118), .Q(
        out_data_r[16]) );
  DFFRX1 out_data_r_reg_17_ ( .D(out_data[17]), .CK(i_clk), .RN(n2111), .Q(
        out_data_r[17]) );
  DFFRX1 out_data_r_reg_18_ ( .D(out_data[18]), .CK(i_clk), .RN(n2112), .Q(
        out_data_r[18]) );
  DFFRX1 out_data_r_reg_19_ ( .D(out_data[19]), .CK(i_clk), .RN(n2111), .Q(
        out_data_r[19]) );
  DFFRX1 out_data_r_reg_20_ ( .D(out_data[20]), .CK(i_clk), .RN(n2111), .Q(
        out_data_r[20]) );
  DFFRX1 out_data_r_reg_21_ ( .D(out_data[21]), .CK(i_clk), .RN(n2111), .Q(
        out_data_r[21]) );
  DFFRX1 out_data_r_reg_22_ ( .D(out_data[22]), .CK(i_clk), .RN(n2111), .Q(
        out_data_r[22]) );
  DFFRX1 out_data_r_reg_23_ ( .D(out_data[23]), .CK(i_clk), .RN(n2111), .Q(
        out_data_r[23]) );
  DFFRX1 counter_r_reg_8_ ( .D(n764), .CK(i_clk), .RN(n2111), .Q(counter_r_8_), 
        .QN(n2078) );
  DFFRX1 census_b_reg_0_ ( .D(N464), .CK(i_clk), .RN(n2111), .Q(N441) );
  DFFRX1 census_b_reg_1_ ( .D(N465), .CK(i_clk), .RN(n2111), .Q(N442) );
  DFFRX1 census_b_reg_2_ ( .D(N466), .CK(i_clk), .RN(n2111), .Q(N443) );
  DFFRX1 census_b_reg_3_ ( .D(N467), .CK(i_clk), .RN(n2111), .Q(N444) );
  DFFRX1 census_b_reg_4_ ( .D(N468), .CK(i_clk), .RN(n2111), .Q(N445) );
  DFFRX1 census_b_reg_5_ ( .D(N469), .CK(i_clk), .RN(n2111), .Q(N446) );
  DFFRX1 census_b_reg_6_ ( .D(N470), .CK(i_clk), .RN(n2111), .Q(N447) );
  DFFRX1 census_b_reg_7_ ( .D(N471), .CK(i_clk), .RN(n2111), .Q(census[7]) );
  DFFRX1 census_g_reg_0_ ( .D(N456), .CK(i_clk), .RN(n2111), .Q(N433) );
  DFFRX1 census_g_reg_1_ ( .D(N457), .CK(i_clk), .RN(n2112), .Q(N434) );
  DFFRX1 census_g_reg_2_ ( .D(N458), .CK(i_clk), .RN(n2112), .Q(N435) );
  DFFRX1 census_g_reg_3_ ( .D(N459), .CK(i_clk), .RN(n2112), .Q(N436) );
  DFFRX1 census_g_reg_4_ ( .D(N460), .CK(i_clk), .RN(n2112), .Q(N437) );
  DFFRX1 census_g_reg_5_ ( .D(N461), .CK(i_clk), .RN(n2112), .Q(N438) );
  DFFRX1 census_g_reg_6_ ( .D(N462), .CK(i_clk), .RN(n2112), .Q(N439) );
  DFFRX1 census_g_reg_7_ ( .D(N463), .CK(i_clk), .RN(n2112), .Q(census[15]) );
  DFFRX1 census_r_reg_0_ ( .D(N448), .CK(i_clk), .RN(n2112), .Q(N425) );
  DFFRX1 census_r_reg_1_ ( .D(N449), .CK(i_clk), .RN(n2112), .Q(N426) );
  DFFRX1 census_r_reg_2_ ( .D(N450), .CK(i_clk), .RN(n2112), .Q(N427) );
  DFFRX1 census_r_reg_3_ ( .D(N451), .CK(i_clk), .RN(n2112), .Q(N428) );
  DFFRX1 census_r_reg_4_ ( .D(N452), .CK(i_clk), .RN(n2112), .Q(N429) );
  DFFRX1 census_r_reg_5_ ( .D(N453), .CK(i_clk), .RN(n2112), .Q(N430) );
  DFFRX1 census_r_reg_6_ ( .D(N454), .CK(i_clk), .RN(n2112), .Q(N431) );
  DFFRX1 census_r_reg_7_ ( .D(N455), .CK(i_clk), .RN(n2112), .Q(census[23]) );
  DFFRX1 valid_r_reg ( .D(valid_w), .CK(i_clk), .RN(n2113), .Q(valid_r) );
  DFFRX1 m_reg_r_reg_4__7_ ( .D(N606), .CK(i_clk), .RN(n2113), .Q(
        m_reg_r_4__7_), .QN(n2081) );
  DFFRX1 m_reg_r_reg_2__7_ ( .D(N622), .CK(i_clk), .RN(n2113), .Q(
        m_reg_r_2__7_), .QN(n2087) );
  DFFRX1 m_reg_r_reg_1__7_ ( .D(N630), .CK(i_clk), .RN(n2113), .Q(
        m_reg_r_1__7_), .QN(n2017) );
  DFFRX1 m_reg_r_reg_4__6_ ( .D(N605), .CK(i_clk), .RN(n2113), .Q(
        m_reg_r_4__6_), .QN(n2097) );
  DFFRX1 m_reg_r_reg_2__6_ ( .D(N621), .CK(i_clk), .RN(n2113), .Q(
        m_reg_r_2__6_), .QN(n2031) );
  DFFRX1 m_reg_r_reg_1__6_ ( .D(N629), .CK(i_clk), .RN(n2113), .Q(
        m_reg_r_1__6_), .QN(n2108) );
  DFFRX1 m_reg_r_reg_4__5_ ( .D(N604), .CK(i_clk), .RN(n2113), .Q(
        m_reg_r_4__5_), .QN(n2094) );
  DFFRX1 m_reg_r_reg_2__5_ ( .D(N620), .CK(i_clk), .RN(n2113), .Q(
        m_reg_r_2__5_), .QN(n2099) );
  DFFRX1 m_reg_r_reg_1__5_ ( .D(N628), .CK(i_clk), .RN(n2114), .QN(n2016) );
  DFFRX1 m_reg_r_reg_4__4_ ( .D(N603), .CK(i_clk), .RN(n2114), .Q(
        m_reg_r_4__4_), .QN(n2052) );
  DFFRX1 m_reg_r_reg_2__4_ ( .D(N619), .CK(i_clk), .RN(n2114), .Q(
        m_reg_r_2__4_), .QN(n2067) );
  DFFRX1 m_reg_r_reg_1__4_ ( .D(N627), .CK(i_clk), .RN(n2114), .Q(
        m_reg_r_1__4_), .QN(n2014) );
  DFFRX1 m_reg_r_reg_4__3_ ( .D(N602), .CK(i_clk), .RN(n2114), .Q(
        m_reg_r_4__3_), .QN(n2056) );
  DFFRX1 m_reg_r_reg_2__3_ ( .D(N618), .CK(i_clk), .RN(n2114), .Q(
        m_reg_r_2__3_), .QN(n2066) );
  DFFRX1 m_reg_r_reg_1__3_ ( .D(N626), .CK(i_clk), .RN(n2114), .Q(
        m_reg_r_1__3_), .QN(n2013) );
  DFFRX1 m_reg_r_reg_4__2_ ( .D(N601), .CK(i_clk), .RN(n2114), .Q(
        m_reg_r_4__2_), .QN(n2049) );
  DFFRX1 m_reg_r_reg_2__2_ ( .D(N617), .CK(i_clk), .RN(n2114), .Q(
        m_reg_r_2__2_), .QN(n2062) );
  DFFRX1 m_reg_r_reg_1__2_ ( .D(N625), .CK(i_clk), .RN(n2115), .Q(
        m_reg_r_1__2_), .QN(n2009) );
  DFFRX1 m_reg_r_reg_4__1_ ( .D(N600), .CK(i_clk), .RN(n2115), .Q(
        m_reg_r_4__1_), .QN(n2047) );
  DFFRX1 m_reg_r_reg_2__1_ ( .D(N616), .CK(i_clk), .RN(n2115), .Q(
        m_reg_r_2__1_), .QN(n2054) );
  DFFRX1 m_reg_r_reg_1__1_ ( .D(N624), .CK(i_clk), .RN(n2115), .Q(
        m_reg_r_1__1_), .QN(n2006) );
  DFFRX1 m_reg_r_reg_4__0_ ( .D(N599), .CK(i_clk), .RN(n2115), .Q(
        m_reg_r_4__0_), .QN(n2103) );
  DFFRX1 m_reg_r_reg_2__0_ ( .D(N615), .CK(i_clk), .RN(n2115), .Q(
        m_reg_r_2__0_), .QN(n2036) );
  DFFRX1 m_reg_r_reg_1__0_ ( .D(N623), .CK(i_clk), .RN(n2115), .Q(
        m_reg_r_1__0_), .QN(n2109) );
  DFFRX1 m_reg_g_reg_4__7_ ( .D(N714), .CK(i_clk), .RN(n2115), .Q(
        m_reg_g_4__7_), .QN(n2080) );
  DFFRX1 m_reg_g_reg_4__6_ ( .D(N713), .CK(i_clk), .RN(n2116), .Q(
        m_reg_g_4__6_), .QN(n2096) );
  DFFRX1 m_reg_g_reg_3__6_ ( .D(N721), .CK(i_clk), .RN(n2116), .Q(
        m_reg_g_3__6_), .QN(n1981) );
  DFFRX1 m_reg_g_reg_4__5_ ( .D(N712), .CK(i_clk), .RN(n2116), .Q(
        m_reg_g_4__5_), .QN(n2093) );
  DFFRX1 m_reg_g_reg_4__4_ ( .D(N711), .CK(i_clk), .RN(n2116), .Q(
        m_reg_g_4__4_), .QN(n1998) );
  DFFRX1 m_reg_g_reg_4__3_ ( .D(N710), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_4__3_), .QN(n2000) );
  DFFRX1 m_reg_g_reg_4__2_ ( .D(N709), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_4__2_), .QN(n1990) );
  DFFRX1 m_reg_g_reg_4__1_ ( .D(N708), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_4__1_), .QN(n1989) );
  DFFRX1 m_reg_g_reg_4__0_ ( .D(N707), .CK(i_clk), .RN(n2118), .Q(
        m_reg_g_4__0_), .QN(n2102) );
  DFFRX1 m_reg_g_reg_3__0_ ( .D(N715), .CK(i_clk), .RN(n2118), .Q(
        m_reg_g_3__0_), .QN(n1985) );
  DFFRX1 m_reg_b_reg_4__7_ ( .D(N822), .CK(i_clk), .RN(n2118), .Q(
        m_reg_b_4__7_), .QN(n2079) );
  DFFRX1 m_reg_b_reg_4__6_ ( .D(N821), .CK(i_clk), .RN(n2118), .Q(
        m_reg_b_4__6_), .QN(n2095) );
  DFFRX1 m_reg_b_reg_4__5_ ( .D(N820), .CK(i_clk), .RN(n2119), .Q(
        m_reg_b_4__5_), .QN(n2092) );
  DFFRX1 m_reg_b_reg_4__4_ ( .D(N819), .CK(i_clk), .RN(n2119), .Q(
        m_reg_b_4__4_), .QN(n1997) );
  DFFRX1 m_reg_b_reg_4__3_ ( .D(N818), .CK(i_clk), .RN(n2119), .Q(
        m_reg_b_4__3_), .QN(n1994) );
  DFFRX1 m_reg_b_reg_4__2_ ( .D(N817), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_4__2_), .QN(n1993) );
  DFFRX1 m_reg_b_reg_4__1_ ( .D(N816), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_4__1_), .QN(n1992) );
  DFFRX1 m_reg_b_reg_4__0_ ( .D(N815), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_4__0_), .QN(n2104) );
  DFFSX4 cstate_reg_1_ ( .D(n779), .CK(i_clk), .SN(i_rst_n), .Q(cstate[1]), 
        .QN(n2043) );
  DFFRX1 m_reg_g_reg_1__6_ ( .D(N737), .CK(i_clk), .RN(n2116), .Q(
        m_reg_g_1__6_), .QN(n2101) );
  DFFRX1 m_reg_g_reg_1__5_ ( .D(N736), .CK(i_clk), .RN(n2116), .QN(n2012) );
  DFFRX1 m_reg_g_reg_1__7_ ( .D(N738), .CK(i_clk), .RN(n2116), .Q(
        m_reg_g_1__7_), .QN(n2020) );
  DFFRX1 m_reg_r_reg_3__7_ ( .D(N614), .CK(i_clk), .RN(n2113), .Q(
        m_reg_r_3__7_), .QN(n2021) );
  DFFRX1 m_reg_g_reg_3__7_ ( .D(N722), .CK(i_clk), .RN(n2115), .Q(
        m_reg_g_3__7_), .QN(n2023) );
  DFFRX1 m_reg_g_reg_2__7_ ( .D(N730), .CK(i_clk), .RN(n2115), .Q(
        m_reg_g_2__7_), .QN(n2085) );
  DFFRX1 m_reg_g_reg_1__4_ ( .D(N735), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_1__4_), .QN(n2068) );
  DFFRX1 m_reg_r_reg_3__5_ ( .D(N612), .CK(i_clk), .RN(n2113), .Q(
        m_reg_r_3__5_), .QN(n2025) );
  DFFRX1 m_reg_r_reg_3__6_ ( .D(N613), .CK(i_clk), .RN(n2113), .Q(
        m_reg_r_3__6_), .QN(n1980) );
  DFFRX1 m_reg_b_reg_2__7_ ( .D(N838), .CK(i_clk), .RN(n2118), .Q(
        m_reg_b_2__7_), .QN(n2084) );
  DFFRX1 m_reg_g_reg_3__5_ ( .D(N720), .CK(i_clk), .RN(n2116), .Q(
        m_reg_g_3__5_), .QN(n2029) );
  DFFRX1 m_reg_g_reg_2__5_ ( .D(N728), .CK(i_clk), .RN(n2116), .Q(
        m_reg_g_2__5_), .QN(n2091) );
  DFFRX1 m_reg_b_reg_3__7_ ( .D(N830), .CK(i_clk), .RN(n2118), .Q(
        m_reg_b_3__7_), .QN(n2018) );
  DFFRX1 m_reg_g_reg_3__4_ ( .D(N719), .CK(i_clk), .RN(n2116), .Q(
        m_reg_g_3__4_), .QN(n2059) );
  DFFRX1 m_reg_g_reg_2__6_ ( .D(N729), .CK(i_clk), .RN(n2116), .Q(
        m_reg_g_2__6_), .QN(n2030) );
  DFFRX1 m_reg_b_reg_3__5_ ( .D(N828), .CK(i_clk), .RN(n2119), .Q(
        m_reg_b_3__5_), .QN(n2024) );
  DFFRX1 m_reg_b_reg_3__6_ ( .D(N829), .CK(i_clk), .RN(n2118), .Q(
        m_reg_b_3__6_), .QN(n2028) );
  DFFRX1 m_reg_r_reg_3__4_ ( .D(N611), .CK(i_clk), .RN(n2114), .Q(
        m_reg_r_3__4_), .QN(n2002) );
  DFFRX1 m_reg_b_reg_2__5_ ( .D(N836), .CK(i_clk), .RN(n2119), .Q(
        m_reg_b_2__5_), .QN(n2090) );
  DFFRX1 m_reg_g_reg_2__4_ ( .D(N727), .CK(i_clk), .RN(n2116), .Q(
        m_reg_g_2__4_), .QN(n2003) );
  DFFRX1 valid_rr_reg ( .D(valid_r), .CK(i_clk), .RN(n2113), .Q(o_out_valid)
         );
  DFFRX1 m_reg_b_reg_3__4_ ( .D(N827), .CK(i_clk), .RN(n2119), .Q(
        m_reg_b_3__4_), .QN(n2061) );
  DFFRX1 m_reg_b_reg_2__6_ ( .D(N837), .CK(i_clk), .RN(n2118), .Q(
        m_reg_b_2__6_), .QN(n1979) );
  DFFRX1 m_reg_g_reg_2__3_ ( .D(N726), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_2__3_), .QN(n1977) );
  DFFRX1 m_reg_g_reg_1__3_ ( .D(N734), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_1__3_), .QN(n2008) );
  DFFRX1 m_reg_g_reg_3__3_ ( .D(N718), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_3__3_), .QN(n2057) );
  DFFRX1 m_reg_g_reg_2__2_ ( .D(N725), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_2__2_), .QN(n1975) );
  DFFRX1 m_reg_g_reg_1__2_ ( .D(N733), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_1__2_), .QN(n2005) );
  DFFRX1 m_reg_b_reg_2__4_ ( .D(N835), .CK(i_clk), .RN(n2119), .Q(
        m_reg_b_2__4_), .QN(n1978) );
  DFFRX1 m_reg_g_reg_3__2_ ( .D(N717), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_3__2_), .QN(n2050) );
  DFFRX1 m_reg_b_reg_3__3_ ( .D(N826), .CK(i_clk), .RN(n2119), .Q(
        m_reg_b_3__3_), .QN(n2060) );
  DFFRX1 m_reg_g_reg_1__0_ ( .D(N731), .CK(i_clk), .RN(n2118), .Q(
        m_reg_g_1__0_), .QN(n2107) );
  DFFRX1 m_reg_b_reg_3__2_ ( .D(N825), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_3__2_), .QN(n2051) );
  DFFRX1 m_reg_g_reg_1__1_ ( .D(N732), .CK(i_clk), .RN(n2118), .Q(
        m_reg_g_1__1_), .QN(n1996) );
  DFFRX1 m_reg_r_reg_3__3_ ( .D(N610), .CK(i_clk), .RN(n2114), .Q(
        m_reg_r_3__3_), .QN(n2001) );
  DFFRX1 m_reg_r_reg_3__2_ ( .D(N609), .CK(i_clk), .RN(n2114), .Q(
        m_reg_r_3__2_), .QN(n1995) );
  DFFRX1 m_reg_g_reg_3__1_ ( .D(N716), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_3__1_), .QN(n2046) );
  DFFRX1 m_reg_r_reg_3__0_ ( .D(N607), .CK(i_clk), .RN(n2115), .Q(
        m_reg_r_3__0_), .QN(n1983) );
  DFFRX1 m_reg_b_reg_2__3_ ( .D(N834), .CK(i_clk), .RN(n2119), .Q(
        m_reg_b_2__3_), .QN(n1976) );
  DFFRX1 m_reg_g_reg_2__0_ ( .D(N723), .CK(i_clk), .RN(n2118), .Q(
        m_reg_g_2__0_), .QN(n2035) );
  DFFRX1 m_reg_g_reg_0__7_ ( .D(n748), .CK(i_clk), .RN(n2116), .Q(
        median_out[15]), .QN(n2083) );
  DFFRX1 m_reg_g_reg_2__1_ ( .D(N724), .CK(i_clk), .RN(n2117), .Q(
        m_reg_g_2__1_), .QN(n1973) );
  DFFRX1 m_reg_b_reg_0__7_ ( .D(n756), .CK(i_clk), .RN(n2118), .Q(
        median_out[7]), .QN(n2082) );
  DFFRX1 m_reg_b_reg_2__2_ ( .D(N833), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_2__2_), .QN(n1974) );
  DFFRX1 m_reg_r_reg_3__1_ ( .D(N608), .CK(i_clk), .RN(n2115), .Q(
        m_reg_r_3__1_), .QN(n1991) );
  DFFRX1 m_reg_b_reg_3__0_ ( .D(N823), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_3__0_), .QN(n2034) );
  DFFRX1 m_reg_b_reg_3__1_ ( .D(N824), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_3__1_), .QN(n2048) );
  DFFRX1 m_reg_b_reg_2__0_ ( .D(N831), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_2__0_), .QN(n1982) );
  DFFRX1 m_reg_r_reg_0__0_ ( .D(n747), .CK(i_clk), .RN(n2115), .Q(
        median_out[16]), .QN(n2038) );
  DFFRX1 m_reg_g_reg_0__0_ ( .D(n755), .CK(i_clk), .RN(n2118), .Q(
        median_out[8]), .QN(n2033) );
  DFFRX1 m_reg_b_reg_0__0_ ( .D(n763), .CK(i_clk), .RN(i_rst_n), .Q(
        median_out[0]), .QN(n2032) );
  DFFRX1 m_reg_r_reg_0__5_ ( .D(n742), .CK(i_clk), .RN(n2114), .Q(
        median_out[21]), .QN(n2071) );
  DFFRX1 m_reg_b_reg_0__5_ ( .D(n758), .CK(i_clk), .RN(n2119), .Q(
        median_out[5]), .QN(n2063) );
  DFFRX1 m_reg_g_reg_0__5_ ( .D(n750), .CK(i_clk), .RN(n2116), .Q(
        median_out[13]), .QN(n2055) );
  DFFRX1 m_reg_b_reg_2__1_ ( .D(N832), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_2__1_), .QN(n1972) );
  DFFRX1 m_reg_r_reg_0__1_ ( .D(n746), .CK(i_clk), .RN(n2115), .Q(
        median_out[17]), .QN(n2076) );
  DFFRX1 m_reg_b_reg_0__1_ ( .D(n762), .CK(i_clk), .RN(n2120), .Q(
        median_out[1]), .QN(n2074) );
  DFFRX1 m_reg_g_reg_0__1_ ( .D(n754), .CK(i_clk), .RN(n2118), .Q(
        median_out[9]), .QN(n2065) );
  DFFRX1 m_reg_r_reg_0__3_ ( .D(n744), .CK(i_clk), .RN(n2114), .Q(
        median_out[19]), .QN(n2105) );
  DFFRX1 m_reg_g_reg_0__3_ ( .D(n752), .CK(i_clk), .RN(n2117), .Q(
        median_out[11]), .QN(n2089) );
  DFFRX1 m_reg_b_reg_0__3_ ( .D(n760), .CK(i_clk), .RN(n2120), .Q(
        median_out[3]), .QN(n2088) );
  DFFRX1 m_reg_b_reg_0__2_ ( .D(n761), .CK(i_clk), .RN(n2120), .Q(
        median_out[2]), .QN(n2072) );
  DFFRX1 m_reg_r_reg_0__2_ ( .D(n745), .CK(i_clk), .RN(n2115), .Q(
        median_out[18]), .QN(n2070) );
  DFFRX1 m_reg_g_reg_0__2_ ( .D(n753), .CK(i_clk), .RN(n2117), .Q(
        median_out[10]), .QN(n2064) );
  DFFRX1 m_reg_r_reg_0__4_ ( .D(n743), .CK(i_clk), .RN(n2114), .Q(
        median_out[20]), .QN(n2075) );
  DFFRX1 m_reg_b_reg_0__4_ ( .D(n759), .CK(i_clk), .RN(n2119), .Q(
        median_out[4]), .QN(n2073) );
  DFFRX1 m_reg_g_reg_0__4_ ( .D(n751), .CK(i_clk), .RN(n2117), .Q(
        median_out[12]), .QN(n2011) );
  DFFRX1 m_reg_r_reg_0__6_ ( .D(n741), .CK(i_clk), .RN(n2113), .Q(
        median_out[22]), .QN(n2037) );
  DFFRX1 m_reg_g_reg_0__6_ ( .D(n749), .CK(i_clk), .RN(n2116), .Q(
        median_out[14]), .QN(n2027) );
  DFFRX1 m_reg_b_reg_0__6_ ( .D(n757), .CK(i_clk), .RN(n2119), .Q(
        median_out[6]), .QN(n2026) );
  DFFRX1 m_reg_r_reg_0__7_ ( .D(n739), .CK(i_clk), .RN(n2113), .Q(
        median_out[23]), .QN(n2098) );
  DFFTRX2 ftr_cnt2_reg_1_ ( .D(1'b1), .RN(N534), .CK(i_clk), .Q(ftr_cnt2[1]), 
        .QN(DP_OP_307_134_2203_n209) );
  DFFTRX2 ftr_cnt2_reg_0_ ( .D(1'b1), .RN(N533), .CK(i_clk), .Q(ftr_cnt2[0]), 
        .QN(n2121) );
  DFFTRX2 ftr_row_reg_1_ ( .D(1'b1), .RN(N536), .CK(i_clk), .Q(ftr_row[1]), 
        .QN(n2122) );
  DFFRX2 img_size_r_reg_4_ ( .D(n765), .CK(i_clk), .RN(n2117), .Q(
        img_size_r[4]), .QN(n2045) );
  DFFRX2 counter_r_reg_0_ ( .D(n777), .CK(i_clk), .RN(n2110), .Q(dsp_pos[0]), 
        .QN(n2040) );
  DFFRX1 m_reg_b_reg_1__7_ ( .D(N846), .CK(i_clk), .RN(n2118), .Q(
        m_reg_b_1__7_), .QN(n2019) );
  DFFRX1 m_reg_b_reg_1__4_ ( .D(N843), .CK(i_clk), .RN(n2119), .Q(
        m_reg_b_1__4_), .QN(n2010) );
  DFFRX1 m_reg_b_reg_1__2_ ( .D(N841), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_1__2_), .QN(n2004) );
  DFFRX1 m_reg_b_reg_1__1_ ( .D(N840), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_1__1_), .QN(n1999) );
  DFFRX2 ftr_zero_pad_r_reg ( .D(ftr_zero_pad_w), .CK(i_clk), .RN(n2116), .QN(
        n2042) );
  DFFRX2 img_origin_r_reg_7_ ( .D(N406), .CK(i_clk), .RN(n2114), .Q(img_pos[7]) );
  DFFRX2 counter_r_reg_1_ ( .D(n776), .CK(i_clk), .RN(n2110), .Q(dsp_pos[1]), 
        .QN(n1988) );
  DFFRX2 counter_r_reg_5_ ( .D(n772), .CK(i_clk), .RN(n2110), .Q(dsp_pos[5])
         );
  DFFRX1 cstate_reg_2_ ( .D(n778), .CK(i_clk), .RN(i_rst_n), .Q(cstate[2]), 
        .QN(n2039) );
  DFFRX1 m_reg_b_reg_1__5_ ( .D(N844), .CK(i_clk), .RN(n2119), .QN(n2015) );
  DFFRX1 m_reg_b_reg_1__6_ ( .D(N845), .CK(i_clk), .RN(n2119), .Q(
        m_reg_b_1__6_), .QN(n2100) );
  DFFRX1 m_reg_b_reg_1__3_ ( .D(N842), .CK(i_clk), .RN(n2120), .Q(
        m_reg_b_1__3_), .QN(n2007) );
  DFFRX1 m_reg_b_reg_1__0_ ( .D(N839), .CK(i_clk), .RN(i_rst_n), .Q(
        m_reg_b_1__0_), .QN(n2106) );
  DFFRX1 out_data_r_reg_5_ ( .D(out_data[5]), .CK(i_clk), .RN(n2113), .Q(
        out_data_r[5]) );
  DFFRX1 out_data_r_reg_7_ ( .D(out_data[7]), .CK(i_clk), .RN(n2118), .Q(
        out_data_r[7]) );
  DFFSX2 cstate_reg_3_ ( .D(n781), .CK(i_clk), .SN(i_rst_n), .Q(cstate[3]), 
        .QN(n2069) );
  DFFRX1 img_origin_r_reg_2_ ( .D(N401), .CK(i_clk), .RN(n2120), .Q(img_pos[2]) );
  OAI222XL U1002 ( .A0(n1233), .A1(n1933), .B0(n2091), .B1(n1234), .C0(n2012), 
        .C1(n1235), .Y(N736) );
  OAI222XL U1003 ( .A0(n1235), .A1(n2005), .B0(n1975), .B1(n1234), .C0(n1930), 
        .C1(n1233), .Y(N733) );
  OAI222XL U1004 ( .A0(n1235), .A1(n2101), .B0(n2030), .B1(n1234), .C0(n1934), 
        .C1(n1233), .Y(N737) );
  OAI222XL U1005 ( .A0(n1233), .A1(n1936), .B0(n2085), .B1(n1234), .C0(n2020), 
        .C1(n1235), .Y(N738) );
  NAND2X2 U1006 ( .A(n1128), .B(n1127), .Y(n1173) );
  NOR2X4 U1007 ( .A(cstate[1]), .B(n1133), .Y(n1234) );
  NAND2X4 U1008 ( .A(n792), .B(n1935), .Y(n1336) );
  OA21X2 U1009 ( .A0(n889), .A1(n1121), .B0(n1014), .Y(n953) );
  NOR2X1 U1010 ( .A(n1927), .B(n1142), .Y(n1144) );
  NOR2X2 U1011 ( .A(n1946), .B(n1125), .Y(n1127) );
  OA21X2 U1012 ( .A0(n936), .A1(n935), .B0(n1014), .Y(n1177) );
  AOI21X1 U1013 ( .A0(n1324), .A1(n811), .B0(n1323), .Y(n1334) );
  INVX6 U1014 ( .A(n1465), .Y(n1220) );
  OR2X1 U1015 ( .A(n1728), .B(n1727), .Y(n1743) );
  OR2X1 U1016 ( .A(n1085), .B(n1084), .Y(n800) );
  INVX1 U1017 ( .A(n1631), .Y(n1610) );
  OAI21X2 U1018 ( .A0(n1130), .A1(cstate[1]), .B0(n1129), .Y(n1131) );
  NAND2X1 U1019 ( .A(n1085), .B(n1084), .Y(n1867) );
  NAND2X1 U1020 ( .A(n799), .B(n798), .Y(n1118) );
  AO21X1 U1021 ( .A0(i_in_valid), .A1(n1916), .B0(n1917), .Y(n1481) );
  CLKINVX1 U1022 ( .A(i_in_valid), .Y(n786) );
  OR2X1 U1023 ( .A(n1113), .B(n1112), .Y(n798) );
  OR2X1 U1024 ( .A(n1848), .B(n1847), .Y(n801) );
  AOI221XL U1025 ( .A0(n961), .A1(n1442), .B0(n1441), .B1(n1442), .C0(n1440), 
        .Y(n962) );
  OAI21XL U1027 ( .A0(n1568), .A1(n1567), .B0(n1566), .Y(n1569) );
  NOR2X1 U1029 ( .A(n1592), .B(n1595), .Y(n1622) );
  NOR2X1 U1030 ( .A(n1601), .B(n1600), .Y(n1621) );
  BUFX8 U1031 ( .A(n1136), .Y(n792) );
  NOR2X1 U1032 ( .A(n1093), .B(n1092), .Y(n1159) );
  NAND2X1 U1033 ( .A(n1113), .B(n1112), .Y(n1476) );
  AOI22X2 U1034 ( .A0(n1399), .A1(n1398), .B0(m_reg_b_4__7_), .B1(n890), .Y(
        n935) );
  CLKINVX1 U1035 ( .A(n1014), .Y(n1012) );
  AOI22X2 U1036 ( .A0(n1419), .A1(n1418), .B0(m_reg_g_4__7_), .B1(n1936), .Y(
        n1130) );
  ADDFXL U1037 ( .A(n8300), .B(n8290), .CI(n8280), .CO(n8400), .S(n8260) );
  ADDFXL U1038 ( .A(n1655), .B(n1572), .CI(n1654), .CO(n1656), .S(n1648) );
  ADDFXL U1039 ( .A(n1582), .B(n1671), .CI(n1670), .CO(n1672), .S(n1657) );
  OA22X1 U1040 ( .A0(m_reg_r_4__6_), .A1(n1944), .B0(m_reg_r_4__7_), .B1(n853), 
        .Y(n1435) );
  OA22X1 U1041 ( .A0(m_reg_b_4__6_), .A1(n1925), .B0(m_reg_b_4__7_), .B1(n890), 
        .Y(n1399) );
  OA22X1 U1042 ( .A0(m_reg_g_4__6_), .A1(n1934), .B0(m_reg_g_4__7_), .B1(n1936), .Y(n1419) );
  AOI32X4 U1043 ( .A0(n1011), .A1(n1010), .A2(n1009), .B0(n1008), .B1(n1010), 
        .Y(n1418) );
  AOI32X4 U1044 ( .A0(n901), .A1(n900), .A2(n899), .B0(n898), .B1(n900), .Y(
        n1398) );
  AOI32X4 U1045 ( .A0(n885), .A1(n884), .A2(n883), .B0(n882), .B1(n884), .Y(
        n1434) );
  OR2X1 U1046 ( .A(n1766), .B(n1765), .Y(n795) );
  NAND2X1 U1047 ( .A(n887), .B(n886), .Y(n1014) );
  OAI22XL U1048 ( .A0(n916), .A1(n915), .B0(n925), .B1(n2007), .Y(n917) );
  OA22X1 U1049 ( .A0(m_reg_r_1__4_), .A1(n1942), .B0(n851), .B1(n850), .Y(
        n1181) );
  OA22X1 U1050 ( .A0(m_reg_g_1__4_), .A1(n1932), .B0(n977), .B1(n976), .Y(
        n1191) );
  OAI21XL U1051 ( .A0(n1265), .A1(n808), .B0(n1264), .Y(n1285) );
  AOI222XL U1052 ( .A0(n1957), .A1(n1452), .B0(n1957), .B1(n2044), .C0(n1452), 
        .C1(n2044), .Y(n1453) );
  OAI22XL U1053 ( .A0(m_reg_g_2__4_), .A1(n1932), .B0(n986), .B1(n985), .Y(
        n990) );
  NAND2X1 U1054 ( .A(median_out[3]), .B(n1922), .Y(n938) );
  CLKBUFX3 U1055 ( .A(n8430), .Y(n1904) );
  OAI22X1 U1056 ( .A0(n868), .A1(n867), .B0(n877), .B1(n2001), .Y(n869) );
  XOR2X1 U1057 ( .A(ftr_cnt[0]), .B(ftr_col[0]), .Y(n1839) );
  INVX1 U1058 ( .A(n1942), .Y(n8450) );
  CLKINVX1 U1059 ( .A(n1923), .Y(n891) );
  ADDFXL U1060 ( .A(n1081), .B(n1080), .CI(n1079), .CO(n1072), .S(n1082) );
  CLKINVX1 U1061 ( .A(n1932), .Y(n1017) );
  INVX1 U1062 ( .A(n1931), .Y(n1003) );
  NOR2X1 U1063 ( .A(n1986), .B(img_size_r[2]), .Y(n1895) );
  OR2X1 U1064 ( .A(n1050), .B(n1049), .Y(n805) );
  NAND2X1 U1065 ( .A(n1050), .B(n1049), .Y(n1887) );
  OAI22XL U1066 ( .A0(n2044), .A1(n1071), .B0(n1986), .B1(n1070), .Y(n1079) );
  NOR2X1 U1067 ( .A(img_size_r[3]), .B(img_size_r[2]), .Y(n1894) );
  INVX3 U1068 ( .A(n1939), .Y(n955) );
  NOR2X1 U1069 ( .A(n8360), .B(n1051), .Y(n1060) );
  OAI22X1 U1070 ( .A0(n8360), .A1(n1875), .B0(n1986), .B1(n1051), .Y(n1050) );
  INVX3 U1071 ( .A(n1929), .Y(n1016) );
  CLKINVX1 U1072 ( .A(n8190), .Y(n8310) );
  CLKINVX1 U1073 ( .A(n8160), .Y(n1071) );
  XOR2X1 U1075 ( .A(ftr_cnt2[0]), .B(ftr_row[0]), .Y(n1780) );
  NOR2XL U1076 ( .A(n2045), .B(n1071), .Y(n8170) );
  INVX3 U1077 ( .A(n1920), .Y(n937) );
  INVXL U1078 ( .A(img_data[4]), .Y(n1573) );
  AND2X1 U1079 ( .A(n8320), .B(n1906), .Y(n1068) );
  OAI21XL U1080 ( .A0(n955), .A1(n2006), .B0(n8460), .Y(n847) );
  NAND2XL U1081 ( .A(n957), .B(n956), .Y(n958) );
  INVXL U1082 ( .A(img_data[13]), .Y(n1613) );
  OR2X2 U1083 ( .A(n1637), .B(img_data[17]), .Y(n1640) );
  NOR2XL U1084 ( .A(n1820), .B(n2044), .Y(n1760) );
  NOR2XL U1085 ( .A(n891), .B(n1997), .Y(n897) );
  NOR2XL U1086 ( .A(n8260), .B(n8250), .Y(n1150) );
  OR2X2 U1087 ( .A(n1735), .B(img_data[15]), .Y(n1737) );
  NOR2XL U1088 ( .A(n1606), .B(n1621), .Y(n1609) );
  NOR2XL U1089 ( .A(n1825), .B(n1824), .Y(n1823) );
  NOR2XL U1090 ( .A(n8450), .B(n2014), .Y(n851) );
  NAND2XL U1091 ( .A(m_reg_g_4__5_), .B(n1933), .Y(n1009) );
  NOR2XL U1092 ( .A(m_reg_b_4__5_), .B(n1924), .Y(n898) );
  INVXL U1093 ( .A(n1299), .Y(n1300) );
  OAI21X1 U1094 ( .A0(n1595), .A1(n1594), .B0(n1593), .Y(n1628) );
  NOR2XL U1095 ( .A(n1490), .B(n2044), .Y(n1488) );
  AOI211XL U1096 ( .A0(n2044), .A1(n1501), .B0(n1500), .C0(img_pos[7]), .Y(
        n1513) );
  NAND2XL U1097 ( .A(n8400), .B(n8390), .Y(n1156) );
  OR2X2 U1098 ( .A(n1472), .B(n2043), .Y(n1465) );
  INVXL U1099 ( .A(n1823), .Y(n1761) );
  INVXL U1102 ( .A(n1667), .Y(n1652) );
  INVXL U1103 ( .A(n1570), .Y(n1556) );
  NAND2XL U1104 ( .A(n8410), .B(n1156), .Y(n8420) );
  NOR2X4 U1105 ( .A(n1472), .B(cstate[1]), .Y(n1221) );
  NOR2XL U1106 ( .A(dsp_pos[5]), .B(n1314), .Y(n1958) );
  CLKINVX2 U1107 ( .A(n1927), .Y(n1926) );
  NAND2X2 U1108 ( .A(n2043), .B(n1135), .Y(n1937) );
  OAI22XL U1109 ( .A0(m_reg_g_1__6_), .A1(n1934), .B0(m_reg_g_1__7_), .B1(
        n1936), .Y(n1194) );
  NAND3XL U1110 ( .A(n2043), .B(cstate[0]), .C(n1251), .Y(n1464) );
  NOR2XL U1111 ( .A(n814), .B(n1359), .Y(N534) );
  OAI222XL U1112 ( .A0(n1337), .A1(n2057), .B0(n2000), .B1(n1131), .C0(n1931), 
        .C1(n1336), .Y(N718) );
  OAI222XL U1113 ( .A0(n1233), .A1(n1932), .B0(n2003), .B1(n1234), .C0(n2068), 
        .C1(n1235), .Y(N735) );
  OAI222XL U1114 ( .A0(n1165), .A1(n853), .B0(n2087), .B1(n1166), .C0(n2017), 
        .C1(n1167), .Y(N630) );
  AO22X1 U1115 ( .A0(n8440), .A1(n1917), .B0(n1916), .B1(n1307), .Y(
        mem_addr[2]) );
  CLKBUFX3 U1116 ( .A(img_size_r[4]), .Y(n1840) );
  INVX3 U1117 ( .A(n1138), .Y(n1337) );
  INVXL U1118 ( .A(n1948), .Y(n1949) );
  OAI22X1 U1119 ( .A0(m_reg_r_3__4_), .A1(n1942), .B0(n870), .B1(n869), .Y(
        n874) );
  OAI21X2 U1120 ( .A0(n1317), .A1(n1316), .B0(n1315), .Y(n1324) );
  AOI21X1 U1121 ( .A0(n1722), .A1(n1721), .B0(n1720), .Y(n1723) );
  INVX1 U1122 ( .A(n1628), .Y(n1607) );
  INVX1 U1123 ( .A(n1622), .Y(n1606) );
  NOR2X1 U1124 ( .A(n8450), .B(n2067), .Y(n860) );
  NOR2X1 U1125 ( .A(n891), .B(n1978), .Y(n929) );
  NOR2X1 U1126 ( .A(n891), .B(n2010), .Y(n918) );
  NOR2X1 U1127 ( .A(n1017), .B(n2068), .Y(n977) );
  ADDFX1 U1128 ( .A(img_data[18]), .B(n1573), .CI(n1572), .CO(n1585), .S(n1574) );
  NOR2X1 U1129 ( .A(n2044), .B(DP_OP_307_134_2203_n256), .Y(n1061) );
  INVX2 U1130 ( .A(n1987), .Y(n1307) );
  NAND2X1 U1131 ( .A(n800), .B(n1867), .Y(n1119) );
  INVX1 U1132 ( .A(n1867), .Y(n1868) );
  AOI31X1 U1133 ( .A0(n1475), .A1(n1474), .A2(n1473), .B0(n1951), .Y(n781) );
  NAND2X4 U1134 ( .A(n2043), .B(n1124), .Y(n1946) );
  AOI21X1 U1135 ( .A0(n1463), .A1(n1462), .B0(n1951), .Y(n780) );
  ADDFX2 U1136 ( .A(n1872), .B(n1871), .CI(n1870), .CO(n1912), .S(n1084) );
  NOR2X1 U1137 ( .A(n1157), .B(n1159), .Y(n1095) );
  NOR2X4 U1138 ( .A(n1130), .B(n1012), .Y(n1135) );
  NAND2XL U1139 ( .A(n1152), .B(n1151), .Y(n1154) );
  AOI21X1 U1140 ( .A0(n1610), .A1(n1609), .B0(n1608), .Y(n1619) );
  AOI21X1 U1141 ( .A0(n1704), .A1(n1677), .B0(n1676), .Y(n1685) );
  AOI21X1 U1142 ( .A0(n1704), .A1(n1703), .B0(n1702), .Y(n1713) );
  NOR2X1 U1143 ( .A(n803), .B(n1857), .Y(n1856) );
  AOI21X1 U1144 ( .A0(n1628), .A1(n1627), .B0(n1626), .Y(n1629) );
  NAND2X1 U1145 ( .A(n1055), .B(n1886), .Y(n1056) );
  INVX1 U1146 ( .A(n1888), .Y(n1055) );
  NOR2X1 U1147 ( .A(n1665), .B(n1662), .Y(n1668) );
  NAND2X1 U1148 ( .A(n1054), .B(n1053), .Y(n1886) );
  AND2X2 U1149 ( .A(n1066), .B(n1906), .Y(n1077) );
  NOR2X1 U1150 ( .A(n1490), .B(n2045), .Y(n1491) );
  NOR2X1 U1151 ( .A(n1490), .B(n1986), .Y(n1489) );
  NAND2X1 U1152 ( .A(n1634), .B(n1633), .Y(n1731) );
  NAND2X1 U1153 ( .A(n1695), .B(n1694), .Y(n1718) );
  NOR2X1 U1154 ( .A(n891), .B(n2061), .Y(n907) );
  INVX1 U1155 ( .A(n1831), .Y(n1759) );
  ADDFX2 U1156 ( .A(n1062), .B(n1061), .CI(n1060), .CO(n1046), .S(n1063) );
  NAND2X1 U1157 ( .A(n941), .B(n2015), .Y(n922) );
  CLKINVX1 U1158 ( .A(n1358), .Y(n1183) );
  NAND2X1 U1159 ( .A(m_reg_g_3__5_), .B(n1933), .Y(n998) );
  NOR2X1 U1160 ( .A(n2044), .B(n1070), .Y(n1062) );
  NOR2X1 U1161 ( .A(n1280), .B(n1283), .Y(n1286) );
  NOR2X1 U1162 ( .A(m_reg_b_2__5_), .B(n1924), .Y(n930) );
  NOR2X1 U1163 ( .A(n1451), .B(n1450), .Y(n1452) );
  NOR2X1 U1164 ( .A(n2044), .B(n1069), .Y(n1080) );
  NOR2X1 U1165 ( .A(m_reg_g_2__5_), .B(n1933), .Y(n987) );
  NAND2X4 U1166 ( .A(cstate[3]), .B(n8150), .Y(n8220) );
  NAND2X1 U1167 ( .A(n1262), .B(n1261), .Y(n1282) );
  NAND2X1 U1168 ( .A(n1288), .B(n1287), .Y(n1292) );
  INVX1 U1169 ( .A(img_data[20]), .Y(n1669) );
  INVX1 U1170 ( .A(img_data[21]), .Y(n1678) );
  NOR2X1 U1171 ( .A(n2045), .B(DP_OP_307_134_2203_n256), .Y(n1064) );
  XNOR2X1 U1172 ( .A(n1119), .B(n1869), .Y(n1120) );
  XOR2X1 U1173 ( .A(n1227), .B(n1226), .Y(n1228) );
  INVX3 U1174 ( .A(n1127), .Y(n1172) );
  INVX3 U1175 ( .A(n1126), .Y(n1174) );
  INVX3 U1176 ( .A(n1144), .Y(n1169) );
  NAND2X1 U1177 ( .A(n802), .B(n1913), .Y(n1914) );
  AOI21X1 U1178 ( .A0(n1478), .A1(n798), .B0(n1224), .Y(n1227) );
  INVX3 U1179 ( .A(n1946), .Y(n1945) );
  INVX1 U1180 ( .A(n963), .Y(n967) );
  INVX3 U1181 ( .A(n1937), .Y(n1935) );
  NAND2X1 U1182 ( .A(n1469), .B(n1468), .Y(n779) );
  NAND2X1 U1183 ( .A(n799), .B(n1225), .Y(n1226) );
  INVX1 U1184 ( .A(n1025), .Y(n1029) );
  NAND2X1 U1185 ( .A(n798), .B(n1476), .Y(n1477) );
  NAND2X4 U1186 ( .A(n2043), .B(n1141), .Y(n1927) );
  NAND2X1 U1187 ( .A(n1161), .B(n1160), .Y(n1162) );
  INVX1 U1188 ( .A(n947), .Y(n951) );
  INVX1 U1189 ( .A(n1159), .Y(n1161) );
  OAI21X1 U1190 ( .A0(n1156), .A1(n1159), .B0(n1160), .Y(n1094) );
  NAND2X1 U1191 ( .A(n1093), .B(n1092), .Y(n1160) );
  AOI21X1 U1192 ( .A0(n1734), .A1(n1733), .B0(n1732), .Y(n1739) );
  INVX1 U1193 ( .A(n1157), .Y(n8410) );
  OAI21X1 U1194 ( .A0(n1150), .A1(n8270), .B0(n1151), .Y(n1096) );
  INVX1 U1195 ( .A(n964), .Y(n966) );
  NOR2X1 U1196 ( .A(n1957), .B(n1314), .Y(n1954) );
  INVX1 U1197 ( .A(n948), .Y(n950) );
  NOR2X1 U1199 ( .A(dsp_pos[1]), .B(n1314), .Y(n1952) );
  INVX1 U1200 ( .A(n1026), .Y(n1028) );
  INVX3 U1201 ( .A(n1481), .Y(n1314) );
  INVX1 U1202 ( .A(n1153), .Y(n8270) );
  NOR2X1 U1203 ( .A(n1472), .B(n1098), .Y(n1099) );
  NAND2X1 U1204 ( .A(n1835), .B(n1757), .Y(n1820) );
  INVX3 U1205 ( .A(n1252), .Y(n1917) );
  NOR2X1 U1206 ( .A(n1715), .B(n1719), .Y(n1721) );
  INVX1 U1207 ( .A(n1592), .Y(n1581) );
  INVX1 U1208 ( .A(n1687), .Y(n1677) );
  NOR2X1 U1209 ( .A(n1017), .B(n2059), .Y(n996) );
  NAND2X1 U1210 ( .A(n1648), .B(n1647), .Y(n1664) );
  INVX1 U1211 ( .A(n1381), .Y(n1355) );
  CLKINVX1 U1212 ( .A(n1904), .Y(n1258) );
  NOR2X4 U1213 ( .A(n1916), .B(n1183), .Y(n1184) );
  NOR2X1 U1214 ( .A(n2015), .B(n941), .Y(n919) );
  ADDHX1 U1215 ( .A(n1065), .B(n1064), .CO(n1066), .S(n8320) );
  NOR2X1 U1216 ( .A(n2012), .B(n1188), .Y(n1189) );
  NOR2X1 U1217 ( .A(n2016), .B(n1178), .Y(n1179) );
  NOR2X1 U1218 ( .A(n8450), .B(n2002), .Y(n870) );
  NOR2X1 U1219 ( .A(n1487), .B(n1486), .Y(n1508) );
  AND2X2 U1220 ( .A(n1934), .B(m_reg_g_1__6_), .Y(n1190) );
  NAND2X1 U1221 ( .A(m_reg_b_2__6_), .B(n1925), .Y(n932) );
  NAND2X1 U1222 ( .A(m_reg_g_2__6_), .B(n1934), .Y(n989) );
  NAND2X1 U1223 ( .A(m_reg_r_2__6_), .B(n1944), .Y(n863) );
  NAND2X1 U1224 ( .A(m_reg_b_4__5_), .B(n1924), .Y(n899) );
  INVX1 U1225 ( .A(n1322), .Y(n1323) );
  NOR2X1 U1226 ( .A(m_reg_r_2__5_), .B(n1943), .Y(n861) );
  NOR3X1 U1227 ( .A(img_size_r[0]), .B(img_size_r[1]), .C(n1897), .Y(n1272) );
  NOR2X1 U1228 ( .A(m_reg_b_3__5_), .B(n1924), .Y(n908) );
  NOR2X1 U1229 ( .A(n8220), .B(n1037), .Y(n1105) );
  NAND2X1 U1230 ( .A(m_reg_r_4__5_), .B(n1943), .Y(n883) );
  NOR2X1 U1231 ( .A(n2041), .B(n1515), .Y(n1256) );
  INVX1 U1232 ( .A(n1464), .Y(o_op_ready) );
  OAI22X2 U1233 ( .A0(n2044), .A1(n8310), .B0(n1819), .B1(n1069), .Y(n1065) );
  AND2X2 U1234 ( .A(n1944), .B(m_reg_r_1__6_), .Y(n1180) );
  INVX12 U1235 ( .A(n8220), .Y(n1906) );
  NOR2X4 U1236 ( .A(n1916), .B(n1358), .Y(n1347) );
  NOR2X1 U1237 ( .A(m_reg_r_3__5_), .B(n1943), .Y(n871) );
  NAND2X1 U1238 ( .A(m_reg_r_3__5_), .B(n1943), .Y(n872) );
  NOR2X1 U1239 ( .A(m_reg_g_3__5_), .B(n1933), .Y(n997) );
  INVX1 U1240 ( .A(n1894), .Y(n1037) );
  NAND2X1 U1241 ( .A(n1319), .B(n1318), .Y(n1322) );
  INVX1 U1242 ( .A(n1245), .Y(n1507) );
  NOR2X1 U1243 ( .A(n1303), .B(n1302), .Y(n1316) );
  NAND2X1 U1244 ( .A(n1303), .B(n1302), .Y(n1315) );
  NAND2X1 U1245 ( .A(n1296), .B(n1295), .Y(n1299) );
  NAND2X4 U1246 ( .A(img_data[16]), .B(n978), .Y(n1938) );
  INVX1 U1247 ( .A(n1750), .Y(n1752) );
  NOR2X1 U1248 ( .A(n1288), .B(n1287), .Y(n1293) );
  NOR2X1 U1249 ( .A(img_size_r[3]), .B(img_size_r[4]), .Y(n1351) );
  INVX1 U1250 ( .A(img_data[12]), .Y(n1596) );
  INVX1 U1251 ( .A(img_data[3]), .Y(n1557) );
  ADDHX1 U1252 ( .A(ftr_cnt2[1]), .B(ftr_row[1]), .CO(n8350), .S(n8160) );
  INVX1 U1253 ( .A(img_data[11]), .Y(n1582) );
  NAND2X1 U1254 ( .A(n1986), .B(img_size_r[2]), .Y(n1035) );
  INVX1 U1255 ( .A(img_data[14]), .Y(n1708) );
  OAI21X2 U1256 ( .A0(n1223), .A1(n1118), .B0(n1117), .Y(n1869) );
  AOI21X2 U1257 ( .A0(n799), .A1(n1224), .B0(n1116), .Y(n1117) );
  OAI2BB1X1 U1258 ( .A0N(n1125), .A1N(n1124), .B0(n1171), .Y(n1126) );
  INVX3 U1259 ( .A(n1137), .Y(n1339) );
  INVX2 U1260 ( .A(n1225), .Y(n1116) );
  NAND2X1 U1262 ( .A(n1912), .B(n1911), .Y(n1913) );
  INVX1 U1263 ( .A(n1476), .Y(n1224) );
  AOI21X2 U1264 ( .A0(n1096), .A1(n1095), .B0(n1094), .Y(n1223) );
  NOR2X4 U1265 ( .A(n1121), .B(n1012), .Y(n1124) );
  INVX1 U1266 ( .A(n1096), .Y(n1158) );
  NOR2X4 U1267 ( .A(n935), .B(n1012), .Y(n1141) );
  ADDFHX2 U1268 ( .A(n1104), .B(n1103), .CI(n1102), .CO(n1870), .S(n1114) );
  NOR2X1 U1269 ( .A(n852), .B(n1180), .Y(n854) );
  ADDFX2 U1270 ( .A(n1111), .B(n1110), .CI(n1109), .CO(n1102), .S(n1112) );
  AND2X1 U1271 ( .A(n1848), .B(n1847), .Y(n1849) );
  NAND2X1 U1272 ( .A(n8260), .B(n8250), .Y(n1151) );
  AOI211X1 U1273 ( .A0(dsp_pos[5]), .A1(n1986), .B0(n1455), .C0(dsp_pos[6]), 
        .Y(n1457) );
  INVX2 U1275 ( .A(n1725), .Y(n1704) );
  ADDFX2 U1276 ( .A(img_pos[3]), .B(n1077), .CI(n1076), .CO(n1074), .S(n1087)
         );
  NAND2X1 U1277 ( .A(n1254), .B(n1253), .Y(n1269) );
  NAND2X1 U1278 ( .A(n1356), .B(ftr_col[0]), .Y(n1385) );
  NAND2XL U1279 ( .A(n1602), .B(n1624), .Y(n1603) );
  INVX1 U1280 ( .A(n1184), .Y(n1230) );
  OR2X1 U1281 ( .A(n1884), .B(n1883), .Y(n807) );
  NOR2X1 U1282 ( .A(n1355), .B(n1354), .Y(n1356) );
  NOR2X4 U1283 ( .A(n1258), .B(cstate[3]), .Y(n1259) );
  OR2X1 U1284 ( .A(n1634), .B(n1633), .Y(n1733) );
  NAND2X1 U1285 ( .A(n2043), .B(n1012), .Y(n1129) );
  NAND3BX2 U1286 ( .AN(i_op_valid), .B(i_rst_n), .C(n1480), .Y(n814) );
  AND2X4 U1287 ( .A(n1904), .B(cstate[3]), .Y(n1260) );
  NOR2X1 U1288 ( .A(n1904), .B(n1906), .Y(n1252) );
  NOR2X1 U1289 ( .A(m_reg_r_4__5_), .B(n1943), .Y(n882) );
  NOR2X1 U1290 ( .A(cstate[0]), .B(n1515), .Y(n1255) );
  NAND2X1 U1291 ( .A(m_reg_r_3__6_), .B(n1944), .Y(n873) );
  NAND2X1 U1292 ( .A(m_reg_b_3__6_), .B(n1925), .Y(n910) );
  NAND2X1 U1293 ( .A(m_reg_g_3__6_), .B(n1934), .Y(n999) );
  INVX1 U1294 ( .A(n1377), .Y(n1354) );
  NOR2X1 U1295 ( .A(m_reg_g_4__5_), .B(n1933), .Y(n1008) );
  NAND2X4 U1296 ( .A(img_data[7]), .B(n978), .Y(n890) );
  OR2X1 U1297 ( .A(n1319), .B(n1318), .Y(n811) );
  OR2X1 U1298 ( .A(n1296), .B(n1295), .Y(n810) );
  NAND2X4 U1299 ( .A(n978), .B(img_data[14]), .Y(n1934) );
  INVX1 U1300 ( .A(img_data[9]), .Y(n1641) );
  NAND2X1 U1301 ( .A(DP_OP_307_134_2203_n209), .B(ftr_cnt2[0]), .Y(n946) );
  NAND2X1 U1302 ( .A(cstate[1]), .B(cstate[0]), .Y(n1486) );
  ADDHX1 U1303 ( .A(ftr_row[0]), .B(ftr_cnt2[0]), .CO(n8180), .S(n8190) );
  INVX2 U1304 ( .A(img_size_r[3]), .Y(n1819) );
  NAND2X4 U1305 ( .A(img_data[23]), .B(n2042), .Y(n853) );
  NOR2X1 U1306 ( .A(ftr_cnt[1]), .B(ftr_cnt2[1]), .Y(n886) );
  NOR2X1 U1307 ( .A(n2123), .B(ftr_cnt2[0]), .Y(n887) );
  NAND2X4 U1311 ( .A(img_data[0]), .B(n2042), .Y(n1919) );
  NOR2X8 U1312 ( .A(n1139), .B(n792), .Y(n1013) );
  AOI22X2 U1313 ( .A0(n1374), .A1(n1373), .B0(m_reg_g_2__7_), .B1(n1936), .Y(
        n1139) );
  NAND2X4 U1314 ( .A(img_data[19]), .B(n2042), .Y(n1941) );
  ADDFX2 U1315 ( .A(img_data[11]), .B(n1641), .CI(n1558), .CO(n1559), .S(n1542) );
  OAI22X1 U1316 ( .A0(n1782), .A1(n1781), .B0(n1803), .B1(n1780), .Y(n1793) );
  ADDFX2 U1317 ( .A(img_data[15]), .B(n1612), .CI(n1611), .CO(n1616), .S(n1601) );
  INVX3 U1318 ( .A(n1143), .Y(n1342) );
  ADDFX2 U1319 ( .A(img_data[14]), .B(n1599), .CI(n1598), .CO(n1600), .S(n1587) );
  OAI211X1 U1320 ( .A0(m_reg_g_4__1_), .A1(n1929), .B0(m_reg_g_4__0_), .C0(
        n1928), .Y(n1001) );
  NAND2X4 U1321 ( .A(n978), .B(img_data[9]), .Y(n1929) );
  AO22X2 U1322 ( .A0(n1164), .A1(n1917), .B0(n1916), .B1(n1957), .Y(
        mem_addr[3]) );
  NAND2X4 U1323 ( .A(img_data[18]), .B(n978), .Y(n1940) );
  NOR2X1 U1324 ( .A(n1054), .B(n1053), .Y(n1888) );
  OAI21X4 U1326 ( .A0(n1132), .A1(n1133), .B0(n2043), .Y(n1032) );
  OAI211X1 U1328 ( .A0(m_reg_b_4__1_), .A1(n1920), .B0(m_reg_b_4__0_), .C0(
        n1919), .Y(n892) );
  OAI211X1 U1329 ( .A0(m_reg_b_3__1_), .A1(n1920), .B0(m_reg_b_3__0_), .C0(
        n1919), .Y(n902) );
  NAND2X4 U1330 ( .A(n978), .B(img_data[1]), .Y(n1920) );
  OAI211X1 U1331 ( .A0(m_reg_r_3__1_), .A1(n1939), .B0(m_reg_r_3__0_), .C0(
        n1938), .Y(n865) );
  OAI211XL U1332 ( .A0(m_reg_r_2__1_), .A1(n1939), .B0(m_reg_r_2__0_), .C0(
        n1938), .Y(n855) );
  NAND2X4 U1333 ( .A(n978), .B(img_data[17]), .Y(n1939) );
  AOI22X2 U1334 ( .A0(n1367), .A1(n1366), .B0(m_reg_r_2__7_), .B1(n853), .Y(
        n1128) );
  OA21X4 U1335 ( .A0(n1015), .A1(n1130), .B0(n1014), .Y(n1133) );
  AOI22X4 U1336 ( .A0(n1363), .A1(n1362), .B0(m_reg_b_3__7_), .B1(n890), .Y(
        n1142) );
  AOI32X4 U1337 ( .A0(n911), .A1(n910), .A2(n909), .B0(n908), .B1(n910), .Y(
        n1362) );
  OAI21X2 U1338 ( .A0(n935), .A1(cstate[1]), .B0(n1129), .Y(n912) );
  NAND2X8 U1339 ( .A(n1134), .B(n1025), .Y(n1235) );
  NOR2X4 U1341 ( .A(n1937), .B(n792), .Y(n1138) );
  AOI22X2 U1342 ( .A0(n1387), .A1(n1386), .B0(m_reg_g_3__7_), .B1(n1936), .Y(
        n1136) );
  ADDHXL U1343 ( .A(img_pos[1]), .B(n1773), .CO(n1774), .S(n1766) );
  OAI22XL U1344 ( .A0(n1805), .A1(n8360), .B0(n1804), .B1(n1986), .Y(n1794) );
  XNOR2X1 U1345 ( .A(ftr_row[1]), .B(DP_OP_307_134_2203_n209), .Y(n1770) );
  INVXL U1346 ( .A(n1035), .Y(n8340) );
  NOR2XL U1347 ( .A(n1790), .B(n1789), .Y(n1788) );
  OAI22XL U1348 ( .A0(n1820), .A1(n8360), .B0(n1835), .B1(n1819), .Y(n1828) );
  XOR2X1 U1349 ( .A(n1828), .B(n1829), .Y(n1852) );
  OAI22XL U1350 ( .A0(n1837), .A1(n1838), .B0(n1830), .B1(n1839), .Y(n1834) );
  NOR2XL U1351 ( .A(n2043), .B(cstate[0]), .Y(n1484) );
  AOI211XL U1352 ( .A0(n1938), .A1(n1436), .B0(n1437), .C0(n1438), .Y(n961) );
  AOI211XL U1353 ( .A0(n1919), .A1(n1400), .B0(n1401), .C0(n1402), .Y(n944) );
  AOI221XL U1354 ( .A0(n1023), .A1(n1426), .B0(n1425), .B1(n1426), .C0(n1424), 
        .Y(n1024) );
  NOR2XL U1355 ( .A(n1307), .B(n1986), .Y(n1450) );
  NOR2XL U1356 ( .A(img_size_r[2]), .B(n2040), .Y(n1237) );
  OAI22XL U1357 ( .A0(m_reg_r_4__3_), .A1(n1941), .B0(m_reg_r_4__2_), .B1(
        n1940), .Y(n878) );
  OAI22XL U1358 ( .A0(m_reg_g_4__3_), .A1(n1931), .B0(m_reg_g_4__2_), .B1(
        n1930), .Y(n1004) );
  OAI22XL U1359 ( .A0(m_reg_b_4__3_), .A1(n1922), .B0(m_reg_b_4__2_), .B1(
        n1921), .Y(n894) );
  OAI21XL U1360 ( .A0(n1645), .A1(n1644), .B0(n1643), .Y(n1667) );
  AOI21XL U1361 ( .A0(n1640), .A1(n1639), .B0(n1638), .Y(n1644) );
  NAND2XL U1362 ( .A(n1642), .B(n1641), .Y(n1643) );
  NOR2XL U1363 ( .A(n1642), .B(n1641), .Y(n1645) );
  XNOR2X2 U1364 ( .A(n1758), .B(n1752), .Y(n1831) );
  XOR2X1 U1365 ( .A(n1856), .B(n1827), .Y(n1863) );
  NAND2XL U1366 ( .A(n1761), .B(n1826), .Y(n1827) );
  NAND2XL U1367 ( .A(n1825), .B(n1824), .Y(n1826) );
  NAND2XL U1368 ( .A(n2121), .B(ftr_cnt2[1]), .Y(n1236) );
  OAI22XL U1370 ( .A0(img_size_r[4]), .A1(n1838), .B0(n1837), .B1(n1839), .Y(
        n1842) );
  XNOR2X1 U1373 ( .A(n1831), .B(img_size_r[2]), .Y(n1830) );
  OAI22XL U1375 ( .A0(n8360), .A1(n1876), .B0(n1819), .B1(n1877), .Y(n1053) );
  NOR2X1 U1376 ( .A(n2045), .B(n1877), .Y(n1049) );
  XOR3X1 U1377 ( .A(n1880), .B(n1879), .C(n1878), .Y(n1884) );
  NOR2XL U1378 ( .A(n1819), .B(DP_OP_284J1_122_4910_n150), .Y(n1880) );
  NOR2XL U1379 ( .A(n2044), .B(n1875), .Y(n1879) );
  OAI22XL U1381 ( .A0(n2044), .A1(n1051), .B0(n1819), .B1(n1875), .Y(n1881) );
  NOR2XL U1382 ( .A(n2045), .B(DP_OP_284J1_122_4910_n150), .Y(n1882) );
  NAND2XL U1383 ( .A(n1884), .B(n1883), .Y(n1885) );
  ADDFXL U1384 ( .A(img_pos[2]), .B(n1787), .CI(n1786), .CO(n1789), .S(n1775)
         );
  OAI22XL U1385 ( .A0(n1782), .A1(n1767), .B0(n1781), .B1(n1780), .Y(n1787) );
  AOI21XL U1386 ( .A0(n795), .A1(n793), .B0(n794), .Y(n1778) );
  NAND2XL U1388 ( .A(n1775), .B(n1774), .Y(n1776) );
  AND2X1 U1389 ( .A(n1794), .B(n1795), .Y(n796) );
  ADDFXL U1390 ( .A(n1802), .B(n1801), .CI(n1779), .CO(n1811), .S(n1796) );
  OAI22XL U1391 ( .A0(n1805), .A1(n1986), .B0(n1804), .B1(n2044), .Y(n1802) );
  NOR2XL U1393 ( .A(n1843), .B(n1842), .Y(n1846) );
  NAND2XL U1394 ( .A(n1843), .B(n1842), .Y(n1844) );
  AND2X1 U1395 ( .A(img_data[9]), .B(img_data[16]), .Y(n809) );
  INVXL U1396 ( .A(n1243), .Y(n1509) );
  INVXL U1397 ( .A(n1892), .Y(n1078) );
  CLKINVX1 U1398 ( .A(n8350), .Y(n1070) );
  NOR2XL U1399 ( .A(n1036), .B(n8360), .Y(n8380) );
  AND2X2 U1400 ( .A(n8170), .B(n1906), .Y(n8330) );
  NOR2XL U1401 ( .A(n2040), .B(n2044), .Y(n1097) );
  NOR2XL U1402 ( .A(ftr_cnt[0]), .B(ftr_col[0]), .Y(n1750) );
  XNOR2X1 U1403 ( .A(ftr_cnt[1]), .B(DP_OP_284J1_122_4910_n165), .Y(n1758) );
  NAND2XL U1404 ( .A(n1798), .B(n1797), .Y(n1799) );
  NAND2XL U1405 ( .A(n1796), .B(n796), .Y(n1797) );
  NOR2XL U1406 ( .A(n1178), .B(n2071), .Y(n960) );
  NAND2XL U1407 ( .A(n1019), .B(n1018), .Y(n1020) );
  NOR2XL U1408 ( .A(n1188), .B(n2055), .Y(n1022) );
  NOR2XL U1409 ( .A(n941), .B(n2063), .Y(n943) );
  ADDFXL U1410 ( .A(img_data[19]), .B(img_data[12]), .CI(img_data[10]), .CO(
        n1287), .S(n1275) );
  NOR2X1 U1411 ( .A(n1275), .B(n1274), .Y(n1283) );
  ADDFXL U1412 ( .A(img_data[18]), .B(img_data[11]), .CI(img_data[9]), .CO(
        n1274), .S(n1262) );
  INVXL U1413 ( .A(img_data[18]), .Y(n1655) );
  INVXL U1414 ( .A(img_data[17]), .Y(n1646) );
  OAI21XL U1415 ( .A0(n1553), .A1(n1552), .B0(n1551), .Y(n1570) );
  NAND2XL U1416 ( .A(n1550), .B(img_data[10]), .Y(n1551) );
  NOR2XL U1417 ( .A(n1550), .B(img_data[10]), .Y(n1552) );
  INVXL U1418 ( .A(n1514), .Y(n1487) );
  MX2X1 U1419 ( .A(n8210), .B(n8200), .S0(n1906), .Y(n8250) );
  OAI22XL U1420 ( .A0(n2045), .A1(n1069), .B0(n1986), .B1(n8310), .Y(n8200) );
  XOR2X1 U1421 ( .A(n1099), .B(n1906), .Y(n8280) );
  XOR2X1 U1422 ( .A(n1108), .B(n1906), .Y(n1113) );
  INVXL U1423 ( .A(n1105), .Y(n1106) );
  XOR2X1 U1424 ( .A(n1044), .B(n1906), .Y(n1085) );
  INVXL U1425 ( .A(n1041), .Y(n1042) );
  AOI211XL U1426 ( .A0(n1892), .A1(n1307), .B0(n1040), .C0(n1039), .Y(n1043)
         );
  AND2X2 U1427 ( .A(n1057), .B(n1906), .Y(n1871) );
  XOR2X1 U1428 ( .A(n1056), .B(n1887), .Y(n1057) );
  XOR3X1 U1429 ( .A(n1910), .B(n1909), .C(n1908), .Y(n1911) );
  AND2X2 U1430 ( .A(n1891), .B(n1906), .Y(n1909) );
  XOR2X1 U1431 ( .A(n1907), .B(n1906), .Y(n1908) );
  NOR2XL U1432 ( .A(n1495), .B(n2044), .Y(n1493) );
  INVXL U1433 ( .A(n1760), .Y(n813) );
  NOR3XL U1434 ( .A(n1817), .B(n1816), .C(n1815), .Y(n1864) );
  XOR2X1 U1435 ( .A(n1809), .B(n1807), .Y(n1816) );
  XNOR2X1 U1436 ( .A(n1798), .B(n1814), .Y(n1815) );
  XOR2X1 U1437 ( .A(n1800), .B(n1799), .Y(n1817) );
  NAND2XL U1438 ( .A(n1859), .B(n1858), .Y(n1860) );
  OAI21XL U1439 ( .A0(n1855), .A1(n1854), .B0(n1853), .Y(n1861) );
  NAND2XL U1440 ( .A(n803), .B(n1857), .Y(n1858) );
  INVXL U1442 ( .A(n1731), .Y(n1732) );
  NAND2XL U1443 ( .A(n1735), .B(img_data[15]), .Y(n1736) );
  NAND2XL U1444 ( .A(n1616), .B(n1615), .Y(n1623) );
  AOI211XL U1445 ( .A0(img_size_r[2]), .A1(n2040), .B0(n1450), .C0(n1240), .Y(
        n1470) );
  NAND3XL U1446 ( .A(n1451), .B(n1239), .C(n1238), .Y(n1240) );
  NOR2XL U1447 ( .A(n1486), .B(cstate[2]), .Y(n8430) );
  OAI22XL U1448 ( .A0(m_reg_r_1__6_), .A1(n1944), .B0(m_reg_r_1__7_), .B1(n853), .Y(n1186) );
  CLKINVX1 U1449 ( .A(n1943), .Y(n1178) );
  AOI32X2 U1450 ( .A0(n874), .A1(n873), .A2(n872), .B0(n871), .B1(n873), .Y(
        n1394) );
  NAND2XL U1451 ( .A(m_reg_g_2__5_), .B(n1933), .Y(n988) );
  NAND2XL U1452 ( .A(m_reg_b_2__5_), .B(n1924), .Y(n931) );
  NOR2XL U1453 ( .A(n1325), .B(img_data[15]), .Y(n1330) );
  NAND2XL U1454 ( .A(n1325), .B(img_data[15]), .Y(n1331) );
  AOI21X1 U1455 ( .A0(n1301), .A1(n810), .B0(n1300), .Y(n1317) );
  OAI21X1 U1456 ( .A0(n1294), .A1(n1293), .B0(n1292), .Y(n1301) );
  AOI21X1 U1457 ( .A0(n1286), .A1(n1285), .B0(n1284), .Y(n1294) );
  OAI21XL U1458 ( .A0(n1283), .A1(n1282), .B0(n1281), .Y(n1284) );
  NAND2XL U1459 ( .A(n1275), .B(n1274), .Y(n1281) );
  INVXL U1460 ( .A(n1283), .Y(n1276) );
  NOR2X1 U1461 ( .A(n1262), .B(n1261), .Y(n1280) );
  INVXL U1462 ( .A(n1285), .Y(n1273) );
  INVXL U1463 ( .A(n1741), .Y(n1742) );
  INVXL U1464 ( .A(img_data[15]), .Y(n1745) );
  NAND2XL U1465 ( .A(n1728), .B(n1727), .Y(n1741) );
  NAND2XL U1466 ( .A(n1716), .B(n1721), .Y(n1724) );
  INVXL U1467 ( .A(n1722), .Y(n1701) );
  NOR2XL U1468 ( .A(n1700), .B(n1715), .Y(n1703) );
  INVXL U1469 ( .A(n1716), .Y(n1700) );
  NAND2XL U1470 ( .A(n1710), .B(n1709), .Y(n1717) );
  INVXL U1471 ( .A(n1719), .Y(n1711) );
  INVXL U1472 ( .A(n1715), .Y(n1696) );
  INVXL U1473 ( .A(n1689), .Y(n1676) );
  NAND2XL U1474 ( .A(n1682), .B(n1681), .Y(n1688) );
  INVXL U1475 ( .A(n1690), .Y(n1683) );
  NAND2XL U1476 ( .A(n1657), .B(n1656), .Y(n1663) );
  INVXL U1477 ( .A(n1665), .Y(n1658) );
  INVXL U1478 ( .A(n1568), .Y(n1561) );
  AOI211XL U1479 ( .A0(n1255), .A1(n1272), .B0(n1514), .C0(n1517), .Y(n1253)
         );
  INVXL U1480 ( .A(n1249), .Y(n1250) );
  MX2X1 U1481 ( .A(n8240), .B(n8230), .S0(n1906), .Y(n1146) );
  XOR2X1 U1482 ( .A(n1105), .B(n1906), .Y(n1148) );
  NOR2XL U1483 ( .A(n1107), .B(n2040), .Y(n8240) );
  NOR2X1 U1484 ( .A(n8400), .B(n8390), .Y(n1157) );
  INVXL U1485 ( .A(n1414), .Y(n1196) );
  ADDHXL U1486 ( .A(ftr_col[1]), .B(ftr_cnt[1]), .CO(n1052), .S(n1048) );
  ADDHXL U1487 ( .A(ftr_col[0]), .B(ftr_cnt[0]), .CO(n1047), .S(n1045) );
  CLKINVX1 U1488 ( .A(n1048), .Y(n1877) );
  INVXL U1489 ( .A(n1052), .Y(n1876) );
  CLKINVX1 U1490 ( .A(n1047), .Y(n1875) );
  CLKINVX1 U1491 ( .A(n1045), .Y(n1051) );
  XNOR2X1 U1493 ( .A(n1779), .B(img_size_r[2]), .Y(n1781) );
  OAI22XL U1494 ( .A0(img_size_r[4]), .A1(n1782), .B0(n1767), .B1(n1780), .Y(
        n1765) );
  XOR2X1 U1495 ( .A(n1772), .B(n1771), .Y(n1804) );
  NAND2XL U1496 ( .A(n1770), .B(n1769), .Y(n1771) );
  NOR2XL U1497 ( .A(ftr_row[1]), .B(DP_OP_307_134_2203_n209), .Y(n1768) );
  INVXL U1498 ( .A(img_data[1]), .Y(n1545) );
  XNOR2X1 U1499 ( .A(n1806), .B(n1803), .Y(n1810) );
  XOR2X1 U1500 ( .A(n1754), .B(n1753), .Y(n1835) );
  NAND2XL U1501 ( .A(n1758), .B(n1752), .Y(n1753) );
  NOR2XL U1502 ( .A(ftr_cnt[1]), .B(DP_OP_284J1_122_4910_n165), .Y(n1751) );
  OAI22XL U1505 ( .A0(n1830), .A1(n1838), .B0(n1759), .B1(n1839), .Y(n1818) );
  OAI21XL U1506 ( .A0(n955), .A1(n2047), .B0(n875), .Y(n876) );
  CLKINVX1 U1507 ( .A(n1940), .Y(n957) );
  NAND2XL U1508 ( .A(median_out[19]), .B(n1941), .Y(n956) );
  AOI2BB1X1 U1509 ( .A0N(n1990), .A1N(n1019), .B0(n1002), .Y(n1005) );
  OAI21XL U1510 ( .A0(n1016), .A1(n1989), .B0(n1001), .Y(n1002) );
  NAND2XL U1511 ( .A(median_out[11]), .B(n1931), .Y(n1018) );
  OAI211XL U1512 ( .A0(m_reg_b_1__1_), .A1(n1920), .B0(m_reg_b_1__0_), .C0(
        n1919), .Y(n913) );
  AOI2BB1X1 U1513 ( .A0N(n1993), .A1N(n939), .B0(n893), .Y(n895) );
  OAI21XL U1514 ( .A0(n937), .A1(n1992), .B0(n892), .Y(n893) );
  AND2X1 U1515 ( .A(n1637), .B(img_data[17]), .Y(n1638) );
  INVXL U1516 ( .A(img_data[16]), .Y(n1639) );
  INVXL U1517 ( .A(img_data[19]), .Y(n1653) );
  INVXL U1518 ( .A(img_data[7]), .Y(n1614) );
  INVXL U1519 ( .A(img_data[6]), .Y(n1597) );
  INVXL U1520 ( .A(img_data[5]), .Y(n1583) );
  NOR2XL U1521 ( .A(img_data[8]), .B(n1544), .Y(n1547) );
  NOR2XL U1522 ( .A(img_data[9]), .B(n1545), .Y(n1548) );
  NAND2XL U1523 ( .A(img_data[9]), .B(n1545), .Y(n1546) );
  INVXL U1524 ( .A(img_data[2]), .Y(n1549) );
  CLKINVX1 U1525 ( .A(n8180), .Y(n1069) );
  AND2X2 U1526 ( .A(n804), .B(n1906), .Y(n1058) );
  AND2X2 U1527 ( .A(n1046), .B(n1906), .Y(n1059) );
  AND2X1 U1528 ( .A(n805), .B(n1887), .Y(n804) );
  ADDFXL U1529 ( .A(img_pos[4]), .B(n1075), .CI(n1074), .CO(n1103), .S(n1110)
         );
  AND2X2 U1530 ( .A(n1063), .B(n1906), .Y(n1075) );
  NOR2XL U1531 ( .A(n1036), .B(n2044), .Y(n1040) );
  OAI211XL U1532 ( .A0(n1902), .A1(n1901), .B0(n1900), .C0(n1899), .Y(n1905)
         );
  NAND2XL U1533 ( .A(n1898), .B(n1897), .Y(n1899) );
  XNOR2X1 U1534 ( .A(n1890), .B(n1889), .Y(n1891) );
  OAI21XL U1535 ( .A0(n1888), .A1(n1887), .B0(n1886), .Y(n1889) );
  NAND2XL U1536 ( .A(n807), .B(n1885), .Y(n1890) );
  AOI21XL U1537 ( .A0(n1792), .A1(n1791), .B0(n797), .Y(n1800) );
  OAI21XL U1538 ( .A0(n1778), .A1(n1777), .B0(n1776), .Y(n1792) );
  AND2X1 U1539 ( .A(n1790), .B(n1789), .Y(n797) );
  INVXL U1540 ( .A(n1808), .Y(n1798) );
  NAND2XL U1541 ( .A(n1813), .B(n1812), .Y(n1814) );
  NAND2XL U1542 ( .A(n1811), .B(n1810), .Y(n1812) );
  INVXL U1543 ( .A(n1809), .Y(n1813) );
  NOR2XL U1544 ( .A(n1811), .B(n1810), .Y(n1809) );
  INVXL U1545 ( .A(n1806), .Y(n812) );
  AND2X1 U1546 ( .A(n1829), .B(n1828), .Y(n803) );
  AOI21XL U1547 ( .A0(n801), .A1(n1850), .B0(n1849), .Y(n1854) );
  OAI21XL U1548 ( .A0(n1846), .A1(n1845), .B0(n1844), .Y(n1850) );
  NAND2XL U1549 ( .A(n1852), .B(n1851), .Y(n1853) );
  INVXL U1550 ( .A(n1856), .Y(n1859) );
  ADDFXL U1551 ( .A(n1822), .B(n1831), .CI(n1821), .CO(n1824), .S(n1857) );
  OAI22XL U1552 ( .A0(n1820), .A1(n1819), .B0(n1835), .B1(n2044), .Y(n1821) );
  XNOR2X1 U1553 ( .A(n1759), .B(n1760), .Y(n1825) );
  NOR2X2 U1554 ( .A(cstate[1]), .B(n949), .Y(n1140) );
  NOR2X1 U1555 ( .A(n947), .B(n949), .Y(n1176) );
  INVXL U1556 ( .A(n1013), .Y(n1015) );
  INVXL U1557 ( .A(n888), .Y(n889) );
  NOR2X1 U1558 ( .A(n963), .B(n965), .Y(n954) );
  AOI22X2 U1559 ( .A0(n1395), .A1(n1394), .B0(m_reg_r_3__7_), .B1(n853), .Y(
        n1125) );
  NOR2X2 U1560 ( .A(cstate[1]), .B(n965), .Y(n1123) );
  CLKINVX1 U1561 ( .A(n1941), .Y(n877) );
  NAND2XL U1562 ( .A(n955), .B(n2076), .Y(n1436) );
  NOR2XL U1563 ( .A(n955), .B(n2076), .Y(n1437) );
  OAI21XL U1564 ( .A0(n1016), .A1(n1996), .B0(n972), .Y(n973) );
  OAI211XL U1565 ( .A0(m_reg_g_1__1_), .A1(n1929), .B0(m_reg_g_1__0_), .C0(
        n1928), .Y(n972) );
  OAI22XL U1566 ( .A0(m_reg_g_3__4_), .A1(n1932), .B0(n996), .B1(n995), .Y(
        n1000) );
  OAI22XL U1567 ( .A0(n994), .A1(n993), .B0(n1003), .B1(n2057), .Y(n995) );
  NAND2XL U1568 ( .A(n1016), .B(n2065), .Y(n1420) );
  NOR2XL U1569 ( .A(n1016), .B(n2065), .Y(n1421) );
  OAI22XL U1570 ( .A0(m_reg_b_3__4_), .A1(n1923), .B0(n907), .B1(n906), .Y(
        n911) );
  OAI22XL U1571 ( .A0(n905), .A1(n904), .B0(n925), .B1(n2060), .Y(n906) );
  NAND2XL U1572 ( .A(n937), .B(n2074), .Y(n1400) );
  NOR2XL U1573 ( .A(n937), .B(n2074), .Y(n1401) );
  ADDHXL U1574 ( .A(img_data[23]), .B(img_data[14]), .CO(n1325), .S(n1318) );
  ADDFXL U1575 ( .A(img_data[22]), .B(img_data[13]), .CI(img_data[15]), .CO(
        n1319), .S(n1303) );
  ADDFXL U1576 ( .A(img_data[21]), .B(img_data[12]), .CI(img_data[14]), .CO(
        n1302), .S(n1296) );
  ADDFXL U1577 ( .A(img_data[20]), .B(img_data[13]), .CI(img_data[11]), .CO(
        n1295), .S(n1288) );
  NAND2XL U1578 ( .A(n809), .B(img_data[10]), .Y(n1264) );
  NOR2XL U1579 ( .A(n809), .B(img_data[10]), .Y(n1265) );
  NOR2X1 U1580 ( .A(n1587), .B(n1586), .Y(n1595) );
  ADDFXL U1581 ( .A(img_data[13]), .B(n1585), .CI(n1584), .CO(n1586), .S(n1577) );
  OAI211XL U1582 ( .A0(img_size_r[0]), .A1(img_size_r[1]), .B0(n1245), .C0(
        n1243), .Y(n1248) );
  OAI2BB1XL U1583 ( .A0N(n1901), .A1N(img_pos[1]), .B0(n1244), .Y(n1246) );
  AOI222XL U1584 ( .A0(img_size_r[4]), .A1(n1453), .B0(img_size_r[4]), .B1(
        n2058), .C0(n1453), .C1(n2058), .Y(n1454) );
  NOR2XL U1585 ( .A(n2069), .B(cstate[2]), .Y(n1249) );
  NAND3XL U1586 ( .A(n2041), .B(cstate[1]), .C(n1251), .Y(n1461) );
  NOR2XL U1587 ( .A(n2045), .B(n8310), .Y(n8230) );
  ADDFXL U1588 ( .A(n1088), .B(n1087), .CI(n1086), .CO(n1109), .S(n1093) );
  MX2X1 U1589 ( .A(n1083), .B(n1082), .S0(n1906), .Y(n1086) );
  XOR2X1 U1590 ( .A(n1903), .B(n1906), .Y(n1088) );
  ADDFXL U1591 ( .A(n1091), .B(n1090), .CI(n1089), .CO(n1092), .S(n8390) );
  MX2X1 U1592 ( .A(n8380), .B(n8370), .S0(n1906), .Y(n1089) );
  OAI22XL U1593 ( .A0(n8360), .A1(n1070), .B0(n1986), .B1(n1071), .Y(n8370) );
  XOR2X1 U1594 ( .A(n1101), .B(n1906), .Y(n1115) );
  MX2X1 U1595 ( .A(n1073), .B(n1072), .S0(n1906), .Y(n1111) );
  NOR3XL U1596 ( .A(n1901), .B(n8360), .C(n1988), .Y(n1073) );
  NOR2XL U1597 ( .A(n1495), .B(n1986), .Y(n1494) );
  OAI21X2 U1598 ( .A0(n954), .A1(n953), .B0(n2043), .Y(n969) );
  OAI21X2 U1599 ( .A0(n1176), .A1(n1177), .B0(n2043), .Y(n1327) );
  OA21X2 U1600 ( .A0(n1235), .A1(n1026), .B0(n1031), .Y(n1033) );
  CLKINVX2 U1601 ( .A(n1140), .Y(n1343) );
  OAI2BB1XL U1602 ( .A0N(n1142), .A1N(n1141), .B0(n912), .Y(n1143) );
  OAI2BB1XL U1603 ( .A0N(n792), .A1N(n1135), .B0(n1131), .Y(n1137) );
  CLKINVX2 U1604 ( .A(n1134), .Y(n1340) );
  CLKBUFX3 U1605 ( .A(n1122), .Y(n1171) );
  OAI21XL U1606 ( .A0(n1121), .A1(cstate[1]), .B0(n1129), .Y(n1122) );
  NAND2X2 U1607 ( .A(img_data[3]), .B(n978), .Y(n1922) );
  NAND2X2 U1608 ( .A(img_data[10]), .B(n978), .Y(n1930) );
  CLKINVX2 U1609 ( .A(n1123), .Y(n1175) );
  AOI32X1 U1610 ( .A0(n1000), .A1(n999), .A2(n998), .B0(n997), .B1(n999), .Y(
        n1386) );
  AND2X1 U1611 ( .A(n1925), .B(m_reg_b_1__6_), .Y(n920) );
  NAND2XL U1612 ( .A(m_reg_b_3__5_), .B(n1924), .Y(n909) );
  INVXL U1613 ( .A(n1621), .Y(n1602) );
  INVXL U1614 ( .A(n1594), .Y(n1580) );
  INVXL U1615 ( .A(n1595), .Y(n1588) );
  NAND2XL U1616 ( .A(n1481), .B(n2077), .Y(n1416) );
  NAND2XL U1617 ( .A(n1515), .B(n1487), .Y(n1467) );
  NAND2X1 U1618 ( .A(n1115), .B(n1114), .Y(n1225) );
  NAND2XL U1620 ( .A(n2040), .B(n1481), .Y(n1482) );
  NAND2XL U1621 ( .A(n1348), .B(img_size_r[3]), .Y(n1349) );
  AOI211XL U1622 ( .A0(n1384), .A1(ftr_col[2]), .B0(n814), .C0(n1372), .Y(N540) );
  NOR2XL U1623 ( .A(ftr_col[2]), .B(n1384), .Y(n1372) );
  NOR3XL U1624 ( .A(n814), .B(ftr_cnt[1]), .C(n2123), .Y(N532) );
  AOI211XL U1625 ( .A0(n1383), .A1(n2122), .B0(n814), .C0(n1382), .Y(N536) );
  AOI211XL U1626 ( .A0(n1385), .A1(DP_OP_284J1_122_4910_n165), .B0(n814), .C0(
        n1384), .Y(N539) );
  INVXL U1627 ( .A(n1383), .Y(n1380) );
  AOI211XL U1628 ( .A0(n1371), .A1(n2121), .B0(n814), .C0(n1370), .Y(N533) );
  NOR2XL U1629 ( .A(n814), .B(n1361), .Y(N535) );
  NOR2XL U1630 ( .A(n814), .B(n1357), .Y(N538) );
  AOI21XL U1631 ( .A0(ftr_cnt2[1]), .A1(n1371), .B0(n1358), .Y(n1359) );
  XOR2X1 U1632 ( .A(n1739), .B(n1738), .Y(n1740) );
  NAND2XL U1633 ( .A(n1737), .B(n1736), .Y(n1738) );
  XOR2X1 U1634 ( .A(n1619), .B(n1618), .Y(n1620) );
  NAND2XL U1635 ( .A(n1617), .B(n1623), .Y(n1618) );
  OAI222XL U1636 ( .A0(n1327), .A1(n2100), .B0(n2026), .B1(n1328), .C0(n1925), 
        .C1(n1329), .Y(n757) );
  OAI222XL U1637 ( .A0(n969), .A1(n2108), .B0(n2037), .B1(n970), .C0(n1944), 
        .C1(n971), .Y(n741) );
  OAI222XL U1638 ( .A0(n1329), .A1(n1923), .B0(n2073), .B1(n1328), .C0(n2010), 
        .C1(n1327), .Y(n759) );
  OAI222XL U1639 ( .A0(n971), .A1(n1942), .B0(n2075), .B1(n970), .C0(n2014), 
        .C1(n969), .Y(n743) );
  OAI222XL U1640 ( .A0(n969), .A1(n2009), .B0(n2070), .B1(n970), .C0(n1940), 
        .C1(n971), .Y(n745) );
  OAI222XL U1641 ( .A0(n1327), .A1(n2004), .B0(n2072), .B1(n1328), .C0(n1921), 
        .C1(n1329), .Y(n761) );
  OAI222XL U1642 ( .A0(n1327), .A1(n2007), .B0(n2088), .B1(n1328), .C0(n1922), 
        .C1(n1329), .Y(n760) );
  OAI222XL U1643 ( .A0(n969), .A1(n2013), .B0(n2105), .B1(n970), .C0(n1941), 
        .C1(n971), .Y(n744) );
  OAI222XL U1644 ( .A0(n1329), .A1(n1920), .B0(n2074), .B1(n1328), .C0(n1999), 
        .C1(n1327), .Y(n762) );
  OAI222XL U1645 ( .A0(n1329), .A1(n1924), .B0(n2063), .B1(n1328), .C0(n2015), 
        .C1(n1327), .Y(n758) );
  OAI222XL U1646 ( .A0(n971), .A1(n1943), .B0(n2071), .B1(n970), .C0(n2016), 
        .C1(n969), .Y(n742) );
  OAI222XL U1647 ( .A0(n1327), .A1(n2106), .B0(n2032), .B1(n1328), .C0(n1919), 
        .C1(n1329), .Y(n763) );
  OAI222XL U1648 ( .A0(n969), .A1(n2109), .B0(n2038), .B1(n970), .C0(n1938), 
        .C1(n971), .Y(n747) );
  AOI22XL U1649 ( .A0(n1947), .A1(i_op_mode[3]), .B0(n1904), .B1(n1470), .Y(
        n1475) );
  AOI211XL U1650 ( .A0(n1947), .A1(i_op_mode[1]), .B0(n1467), .C0(n1466), .Y(
        n1469) );
  AOI211XL U1651 ( .A0(n1182), .A1(n1181), .B0(n1180), .C0(n1179), .Y(n1187)
         );
  OAI211XL U1652 ( .A0(n1449), .A1(n2087), .B0(n1369), .C0(n1368), .Y(N450) );
  NAND2XL U1653 ( .A(n1347), .B(N426), .Y(n1368) );
  OAI211XL U1654 ( .A0(n1449), .A1(n2021), .B0(n1397), .C0(n1396), .Y(N449) );
  NAND3XL U1655 ( .A(n1184), .B(n1395), .C(n1394), .Y(n1397) );
  OAI211XL U1656 ( .A0(n2081), .A1(n1449), .B0(n1448), .C0(n1447), .Y(N448) );
  NAND2XL U1657 ( .A(n1347), .B(n1446), .Y(n1447) );
  AND2X1 U1658 ( .A(n1347), .B(N436), .Y(N460) );
  AOI211XL U1659 ( .A0(n1192), .A1(n1191), .B0(n1190), .C0(n1189), .Y(n1195)
         );
  OAI211XL U1660 ( .A0(n1433), .A1(n2085), .B0(n1376), .C0(n1375), .Y(N458) );
  NAND2XL U1661 ( .A(n1347), .B(N434), .Y(n1375) );
  OAI211XL U1662 ( .A0(n1433), .A1(n2023), .B0(n1389), .C0(n1388), .Y(N457) );
  NAND2XL U1663 ( .A(n1347), .B(N433), .Y(n1388) );
  NAND3XL U1664 ( .A(n1184), .B(n1387), .C(n1386), .Y(n1389) );
  OAI211XL U1665 ( .A0(n2080), .A1(n1433), .B0(n1432), .C0(n1431), .Y(N456) );
  NAND2XL U1666 ( .A(n1347), .B(n1430), .Y(n1431) );
  AND2X1 U1667 ( .A(n1347), .B(N447), .Y(N471) );
  AND2X1 U1668 ( .A(n1347), .B(N445), .Y(N469) );
  AND2X1 U1669 ( .A(n1347), .B(N444), .Y(N468) );
  OAI211XL U1670 ( .A0(n1413), .A1(n2084), .B0(n1393), .C0(n1392), .Y(N466) );
  NAND2XL U1671 ( .A(n1347), .B(N442), .Y(n1392) );
  OAI211XL U1672 ( .A0(n1413), .A1(n2018), .B0(n1365), .C0(n1364), .Y(N465) );
  NAND2XL U1673 ( .A(n1347), .B(N441), .Y(n1364) );
  NAND3XL U1674 ( .A(n1184), .B(n1363), .C(n1362), .Y(n1365) );
  OAI211XL U1675 ( .A0(n2079), .A1(n1413), .B0(n1412), .C0(n1411), .Y(N464) );
  NAND2XL U1676 ( .A(n1347), .B(n1410), .Y(n1411) );
  AOI32XL U1677 ( .A0(n1417), .A1(counter_r_8_), .A2(n1416), .B0(n1415), .B1(
        n2078), .Y(n764) );
  NAND3XL U1678 ( .A(dsp_pos[7]), .B(n1414), .C(n1481), .Y(n1415) );
  OAI21XL U1679 ( .A0(n1334), .A1(n1330), .B0(n1331), .Y(n1326) );
  NAND2XL U1680 ( .A(n1332), .B(n1331), .Y(n1333) );
  INVXL U1681 ( .A(n1330), .Y(n1332) );
  XNOR2X1 U1682 ( .A(n1324), .B(n1320), .Y(n1321) );
  NAND2XL U1683 ( .A(n811), .B(n1322), .Y(n1320) );
  XOR2X1 U1684 ( .A(n1317), .B(n1305), .Y(n1306) );
  NAND2XL U1685 ( .A(n1304), .B(n1315), .Y(n1305) );
  INVXL U1686 ( .A(n1316), .Y(n1304) );
  NAND2XL U1687 ( .A(n810), .B(n1299), .Y(n1297) );
  XOR2X1 U1688 ( .A(n1294), .B(n1290), .Y(n1291) );
  NAND2XL U1689 ( .A(n1289), .B(n1292), .Y(n1290) );
  INVXL U1690 ( .A(n1293), .Y(n1289) );
  NAND2XL U1691 ( .A(n1276), .B(n1281), .Y(n1277) );
  OAI21XL U1692 ( .A0(n1273), .A1(n1280), .B0(n1282), .Y(n1278) );
  XOR2X1 U1693 ( .A(n1266), .B(n1273), .Y(n1267) );
  NAND2XL U1694 ( .A(n1263), .B(n1282), .Y(n1266) );
  INVXL U1695 ( .A(n1280), .Y(n1263) );
  NAND2XL U1697 ( .A(n1711), .B(n1717), .Y(n1712) );
  NAND2XL U1698 ( .A(n1696), .B(n1718), .Y(n1697) );
  AOI21XL U1699 ( .A0(n1704), .A1(n1716), .B0(n1722), .Y(n1698) );
  NAND2XL U1700 ( .A(n1683), .B(n1688), .Y(n1684) );
  NAND2XL U1701 ( .A(n1677), .B(n1689), .Y(n1674) );
  NAND2XL U1702 ( .A(n1658), .B(n1663), .Y(n1659) );
  NAND2XL U1703 ( .A(n1649), .B(n1664), .Y(n1650) );
  INVXL U1704 ( .A(n1662), .Y(n1649) );
  NAND2XL U1705 ( .A(n1733), .B(n1731), .Y(n1635) );
  NAND2XL U1706 ( .A(n1581), .B(n1594), .Y(n1578) );
  NAND2XL U1707 ( .A(n1561), .B(n1566), .Y(n1562) );
  NAND2XL U1708 ( .A(n1543), .B(n1567), .Y(n1554) );
  INVXL U1709 ( .A(n1565), .Y(n1543) );
  NAND2XL U1710 ( .A(n1947), .B(i_op_mode[2]), .Y(n1950) );
  AOI211XL U1711 ( .A0(n1947), .A1(i_op_mode[0]), .B0(n1460), .C0(n1467), .Y(
        n1462) );
  AOI211XL U1712 ( .A0(n1906), .A1(n1471), .B0(n1916), .C0(n1458), .Y(n1463)
         );
  INVXL U1713 ( .A(n1459), .Y(n1460) );
  INVXL U1714 ( .A(n1150), .Y(n1152) );
  XOR2X1 U1715 ( .A(n1158), .B(n8420), .Y(n8440) );
  XNOR2X1 U1716 ( .A(n1163), .B(n1162), .Y(n1164) );
  OAI21XL U1717 ( .A0(n1158), .A1(n1157), .B0(n1156), .Y(n1163) );
  XNOR2X1 U1718 ( .A(n1478), .B(n1477), .Y(n1479) );
  AO22X2 U1719 ( .A0(n1918), .A1(n1917), .B0(dsp_pos[7]), .B1(n1916), .Y(
        mem_addr[7]) );
  AOI21X1 U1720 ( .A0(n1869), .A1(n800), .B0(n1868), .Y(n1915) );
  XOR2X1 U1721 ( .A(n1915), .B(n1914), .Y(n1918) );
  ADDFX2 U1722 ( .A(img_pos[2]), .B(n1068), .CI(n1067), .CO(n1076), .S(n1091)
         );
  ADDHXL U1723 ( .A(img_pos[0]), .B(n1906), .CO(n8300), .S(n1147) );
  ADDFXL U1724 ( .A(n1520), .B(img_pos[6]), .CI(n1519), .CO(n1498), .S(n1521)
         );
  ADDFXL U1725 ( .A(img_pos[6]), .B(n1834), .CI(n1833), .CO(n1851), .S(n1848)
         );
  ADDHXL U1726 ( .A(img_pos[6]), .B(n1873), .CO(n1874), .S(n1872) );
  AOI21XL U1727 ( .A0(n1957), .A1(n1840), .B0(n1307), .Y(n1038) );
  NAND2XL U1728 ( .A(dsp_pos[5]), .B(n1959), .Y(n1313) );
  NAND2X2 U1729 ( .A(n1031), .B(n1030), .Y(n1034) );
  NAND2X2 U1730 ( .A(n1031), .B(n968), .Y(n971) );
  NAND2X2 U1731 ( .A(n1031), .B(n952), .Y(n1329) );
  NAND2X2 U1732 ( .A(cstate[1]), .B(n1183), .Y(n1031) );
  ADDHXL U1733 ( .A(img_pos[3]), .B(n1793), .CO(n1801), .S(n1795) );
  NAND2XL U1734 ( .A(img_pos[3]), .B(img_pos[2]), .Y(n1245) );
  ADDFXL U1735 ( .A(img_pos[5]), .B(n1059), .CI(n1058), .CO(n1873), .S(n1104)
         );
  ADDHXL U1736 ( .A(img_pos[5]), .B(n1836), .CO(n1833), .S(n1843) );
  AOI211XL U1737 ( .A0(n1307), .A1(n1986), .B0(dsp_pos[1]), .C0(n1237), .Y(
        n1451) );
  AOI22XL U1738 ( .A0(n1895), .A1(dsp_pos[1]), .B0(n8340), .B1(dsp_pos[0]), 
        .Y(n1036) );
  AOI211XL U1739 ( .A0(n1840), .A1(n1307), .B0(n1097), .C0(dsp_pos[1]), .Y(
        n1902) );
  AND3X1 U1740 ( .A(dsp_pos[1]), .B(dsp_pos[0]), .C(n1307), .Y(n1955) );
  ADDHXL U1741 ( .A(img_pos[7]), .B(n1818), .CO(n1822), .S(n1829) );
  XOR2X1 U1742 ( .A(img_pos[7]), .B(n1874), .Y(n1910) );
  NAND2X2 U1743 ( .A(img_data[11]), .B(n2042), .Y(n1931) );
  ADDHXL U1744 ( .A(img_pos[1]), .B(n8330), .CO(n1067), .S(n8290) );
  AOI211XL U1745 ( .A0(img_pos[1]), .A1(n1986), .B0(img_pos[0]), .C0(n8360), 
        .Y(n1504) );
  AND2X1 U1746 ( .A(n1766), .B(n1765), .Y(n794) );
  NOR2XL U1747 ( .A(n1796), .B(n796), .Y(n1808) );
  OR2X2 U1748 ( .A(n1115), .B(n1114), .Y(n799) );
  OR2X2 U1749 ( .A(n1912), .B(n1911), .Y(n802) );
  NAND2XL U1750 ( .A(n1831), .B(n813), .Y(n806) );
  NAND2XL U1751 ( .A(n812), .B(n1779), .Y(n1807) );
  INVXL U1752 ( .A(n1779), .Y(n1803) );
  XNOR2X2 U1753 ( .A(n1770), .B(n1769), .Y(n1779) );
  INVX3 U1754 ( .A(n1840), .Y(n8360) );
  XOR2X1 U1755 ( .A(img_data[8]), .B(img_data[17]), .Y(n808) );
  INVXL U1756 ( .A(img_data[8]), .Y(n1637) );
  INVXL U1757 ( .A(img_data[10]), .Y(n1572) );
  NOR2XL U1758 ( .A(ftr_cnt2[0]), .B(ftr_row[0]), .Y(n1762) );
  XOR2X1 U1763 ( .A(n1795), .B(n1794), .Y(n1790) );
  OAI21XL U1764 ( .A0(n955), .A1(n1991), .B0(n865), .Y(n866) );
  INVXL U1765 ( .A(img_data[0]), .Y(n1544) );
  INVXL U1766 ( .A(n1788), .Y(n1791) );
  NAND2XL U1767 ( .A(dsp_pos[4]), .B(n1840), .Y(n1893) );
  AOI2BB1X1 U1768 ( .A0N(n2049), .A1N(n957), .B0(n876), .Y(n879) );
  XOR2X1 U1769 ( .A(n1041), .B(n1906), .Y(n1090) );
  NOR2XL U1770 ( .A(n1852), .B(n1851), .Y(n1855) );
  AOI211XL U1771 ( .A0(n1928), .A1(n1420), .B0(n1421), .C0(n1422), .Y(n1023)
         );
  OAI22XL U1772 ( .A0(n984), .A1(n983), .B0(n1003), .B1(n1977), .Y(n985) );
  INVXL U1773 ( .A(n1625), .Y(n1617) );
  AOI221XL U1774 ( .A0(n944), .A1(n1406), .B0(n1405), .B1(n1406), .C0(n1404), 
        .Y(n945) );
  NAND2XL U1775 ( .A(m_reg_r_2__5_), .B(n1943), .Y(n862) );
  CLKINVX1 U1776 ( .A(n1933), .Y(n1188) );
  NAND2XL U1777 ( .A(n1587), .B(n1586), .Y(n1593) );
  AOI211XL U1778 ( .A0(img_pos[2]), .A1(n2044), .B0(img_pos[3]), .C0(n1505), 
        .Y(n1511) );
  XNOR2X1 U1779 ( .A(n1861), .B(n1860), .Y(n1862) );
  AOI22X1 U1780 ( .A0(n1391), .A1(n1390), .B0(m_reg_b_2__7_), .B1(n890), .Y(
        n1145) );
  OAI211XL U1781 ( .A0(n1471), .A1(n1465), .B0(n1474), .C0(n1464), .Y(n1466)
         );
  NAND2XL U1782 ( .A(n1743), .B(n1741), .Y(n1729) );
  INVXL U1783 ( .A(n1351), .Y(n1897) );
  NOR2X2 U1784 ( .A(cstate[1]), .B(n1177), .Y(n1345) );
  NAND2X2 U1785 ( .A(img_data[2]), .B(n978), .Y(n1921) );
  NOR2X2 U1786 ( .A(cstate[1]), .B(n953), .Y(n1166) );
  NAND2XL U1787 ( .A(n1347), .B(N425), .Y(n1396) );
  XOR2X1 U1788 ( .A(n1334), .B(n1333), .Y(n1335) );
  NAND2XL U1789 ( .A(n1957), .B(n1955), .Y(n1311) );
  XNOR2X1 U1790 ( .A(n1154), .B(n1153), .Y(n1155) );
  OAI211XL U1791 ( .A0(n1350), .A1(n2045), .B0(n1480), .C0(n1349), .Y(n765) );
  AOI211XL U1792 ( .A0(n1380), .A1(n1379), .B0(n814), .C0(n1378), .Y(N537) );
  OAI222XL U1793 ( .A0(n971), .A1(n853), .B0(n2098), .B1(n970), .C0(n2017), 
        .C1(n969), .Y(n739) );
  OAI222XL U1794 ( .A0(n971), .A1(n1939), .B0(n2076), .B1(n970), .C0(n2006), 
        .C1(n969), .Y(n746) );
  OAI222XL U1795 ( .A0(n1329), .A1(n890), .B0(n2082), .B1(n1328), .C0(n2019), 
        .C1(n1327), .Y(n756) );
  OAI222XL U1796 ( .A0(n1169), .A1(n2018), .B0(n2079), .B1(n912), .C0(n890), 
        .C1(n1168), .Y(N830) );
  AND2X1 U1797 ( .A(n1347), .B(N428), .Y(N452) );
  AND2X1 U1798 ( .A(n1347), .B(N446), .Y(N470) );
  NOR2BX1 U1809 ( .AN(n2039), .B(cstate[3]), .Y(n1251) );
  NOR2BX1 U1810 ( .AN(n2041), .B(cstate[1]), .Y(n1492) );
  NOR2X2 U1812 ( .A(n2039), .B(cstate[0]), .Y(n8150) );
  INVX16 U1813 ( .A(n1906), .Y(n1472) );
  CLKINVX1 U1814 ( .A(n1895), .Y(n1098) );
  NAND2X1 U1815 ( .A(n1894), .B(n1840), .Y(n1107) );
  OAI22XL U1816 ( .A0(n2040), .A1(n1098), .B0(n1107), .B1(n1988), .Y(n8210) );
  NOR2X1 U1817 ( .A(n1472), .B(n1035), .Y(n1041) );
  NAND2X4 U1818 ( .A(img_data[21]), .B(n978), .Y(n1943) );
  NAND2X4 U1819 ( .A(n978), .B(img_data[20]), .Y(n1942) );
  OAI211X1 U1820 ( .A0(m_reg_r_1__1_), .A1(n1939), .B0(m_reg_r_1__0_), .C0(
        n1938), .Y(n8460) );
  AOI2BB1X1 U1821 ( .A0N(n2009), .A1N(n957), .B0(n847), .Y(n849) );
  OAI22XL U1822 ( .A0(m_reg_r_1__3_), .A1(n1941), .B0(m_reg_r_1__2_), .B1(
        n1940), .Y(n848) );
  OAI22X1 U1823 ( .A0(n849), .A1(n848), .B0(n877), .B1(n2013), .Y(n850) );
  AOI2BB2X1 U1824 ( .B0(n2016), .B1(n1178), .A0N(n1181), .A1N(n1179), .Y(n852)
         );
  NAND2X4 U1825 ( .A(n978), .B(img_data[22]), .Y(n1944) );
  OAI2BB2X2 U1826 ( .B0(n854), .B1(n1186), .A0N(n853), .A1N(m_reg_r_1__7_), 
        .Y(n963) );
  OA22X1 U1827 ( .A0(m_reg_r_2__6_), .A1(n1944), .B0(m_reg_r_2__7_), .B1(n853), 
        .Y(n1367) );
  OAI21X1 U1828 ( .A0(n955), .A1(n2054), .B0(n855), .Y(n856) );
  AOI2BB1X1 U1829 ( .A0N(n2062), .A1N(n957), .B0(n856), .Y(n858) );
  OAI22XL U1830 ( .A0(m_reg_r_2__3_), .A1(n1941), .B0(m_reg_r_2__2_), .B1(
        n1940), .Y(n857) );
  OAI22X1 U1831 ( .A0(n858), .A1(n857), .B0(n877), .B1(n2066), .Y(n859) );
  OAI22X1 U1832 ( .A0(m_reg_r_2__4_), .A1(n1942), .B0(n860), .B1(n859), .Y(
        n864) );
  AOI32X1 U1833 ( .A0(n864), .A1(n863), .A2(n862), .B0(n861), .B1(n863), .Y(
        n1366) );
  OA22X1 U1834 ( .A0(m_reg_r_3__6_), .A1(n1944), .B0(m_reg_r_3__7_), .B1(n853), 
        .Y(n1395) );
  AOI2BB1X1 U1835 ( .A0N(n1995), .A1N(n957), .B0(n866), .Y(n868) );
  OAI22XL U1836 ( .A0(m_reg_r_3__3_), .A1(n1941), .B0(m_reg_r_3__2_), .B1(
        n1940), .Y(n867) );
  NOR2X1 U1837 ( .A(n8450), .B(n2052), .Y(n881) );
  OAI211X1 U1838 ( .A0(m_reg_r_4__1_), .A1(n1939), .B0(m_reg_r_4__0_), .C0(
        n1938), .Y(n875) );
  OAI22X1 U1839 ( .A0(n879), .A1(n878), .B0(n877), .B1(n2056), .Y(n880) );
  NAND2X1 U1840 ( .A(m_reg_r_4__6_), .B(n1944), .Y(n884) );
  AOI22X4 U1841 ( .A0(n1435), .A1(n1434), .B0(m_reg_r_4__7_), .B1(n853), .Y(
        n1121) );
  NAND2X4 U1842 ( .A(n888), .B(n1124), .Y(n965) );
  NAND2X2 U1843 ( .A(n954), .B(n2043), .Y(n1165) );
  NAND2X4 U1844 ( .A(n1123), .B(n963), .Y(n1167) );
  NAND2X4 U1845 ( .A(n978), .B(img_data[6]), .Y(n1925) );
  NAND2X4 U1846 ( .A(n978), .B(img_data[4]), .Y(n1923) );
  INVX3 U1847 ( .A(n1921), .Y(n939) );
  OAI22X1 U1849 ( .A0(n895), .A1(n894), .B0(n925), .B1(n1994), .Y(n896) );
  OAI22X1 U1850 ( .A0(m_reg_b_4__4_), .A1(n1923), .B0(n897), .B1(n896), .Y(
        n901) );
  NAND2X1 U1851 ( .A(m_reg_b_4__6_), .B(n1925), .Y(n900) );
  NAND2X4 U1852 ( .A(img_data[5]), .B(n978), .Y(n1924) );
  OA22X1 U1853 ( .A0(m_reg_b_3__6_), .A1(n1925), .B0(m_reg_b_3__7_), .B1(n890), 
        .Y(n1363) );
  OAI21X1 U1854 ( .A0(n937), .A1(n2048), .B0(n902), .Y(n903) );
  AOI2BB1X1 U1855 ( .A0N(n2051), .A1N(n939), .B0(n903), .Y(n905) );
  OAI22XL U1856 ( .A0(m_reg_b_3__3_), .A1(n1922), .B0(m_reg_b_3__2_), .B1(
        n1921), .Y(n904) );
  NAND2X2 U1857 ( .A(n1142), .B(n1926), .Y(n1168) );
  CLKINVX1 U1858 ( .A(n1924), .Y(n941) );
  OAI21XL U1859 ( .A0(n937), .A1(n1999), .B0(n913), .Y(n914) );
  AOI2BB1X1 U1860 ( .A0N(n2004), .A1N(n939), .B0(n914), .Y(n916) );
  OAI22XL U1861 ( .A0(m_reg_b_1__3_), .A1(n1922), .B0(m_reg_b_1__2_), .B1(
        n1921), .Y(n915) );
  OA22X2 U1862 ( .A0(m_reg_b_1__4_), .A1(n1923), .B0(n918), .B1(n917), .Y(n921) );
  AOI211X1 U1863 ( .A0(n922), .A1(n921), .B0(n920), .C0(n919), .Y(n1232) );
  OAI22XL U1864 ( .A0(m_reg_b_1__6_), .A1(n1925), .B0(m_reg_b_1__7_), .B1(n890), .Y(n1231) );
  OAI2BB2X2 U1865 ( .B0(n1232), .B1(n1231), .A0N(n890), .A1N(m_reg_b_1__7_), 
        .Y(n947) );
  OA22X1 U1866 ( .A0(m_reg_b_2__6_), .A1(n1925), .B0(m_reg_b_2__7_), .B1(n890), 
        .Y(n1391) );
  OAI211X1 U1867 ( .A0(m_reg_b_2__1_), .A1(n1920), .B0(m_reg_b_2__0_), .C0(
        n1919), .Y(n923) );
  OAI21X1 U1868 ( .A0(n937), .A1(n1972), .B0(n923), .Y(n924) );
  AOI2BB1X1 U1869 ( .A0N(n1974), .A1N(n939), .B0(n924), .Y(n927) );
  OAI22XL U1870 ( .A0(m_reg_b_2__3_), .A1(n1922), .B0(m_reg_b_2__2_), .B1(
        n1921), .Y(n926) );
  OAI22X1 U1871 ( .A0(n927), .A1(n926), .B0(n925), .B1(n1976), .Y(n928) );
  OAI22X1 U1872 ( .A0(m_reg_b_2__4_), .A1(n1923), .B0(n929), .B1(n928), .Y(
        n933) );
  AOI32X1 U1873 ( .A0(n933), .A1(n932), .A2(n931), .B0(n930), .B1(n932), .Y(
        n1390) );
  NOR2X4 U1874 ( .A(n1145), .B(n1142), .Y(n934) );
  NAND2X4 U1875 ( .A(n934), .B(n1141), .Y(n949) );
  CLKINVX1 U1876 ( .A(n934), .Y(n936) );
  NAND2X4 U1877 ( .A(n1140), .B(n947), .Y(n1344) );
  OAI21XL U1878 ( .A0(n939), .A1(n2072), .B0(n938), .Y(n1402) );
  AOI2BB2X1 U1879 ( .B0(median_out[5]), .B1(n1924), .A0N(n2073), .A1N(n891), 
        .Y(n1406) );
  NAND2X1 U1880 ( .A(n939), .B(n938), .Y(n940) );
  OAI22XL U1881 ( .A0(median_out[2]), .A1(n940), .B0(median_out[3]), .B1(n1922), .Y(n1405) );
  AOI2BB2X1 U1882 ( .B0(n2063), .B1(n941), .A0N(median_out[6]), .A1N(n1925), 
        .Y(n942) );
  OAI31XL U1883 ( .A0(n943), .A1(median_out[4]), .A2(n1923), .B0(n942), .Y(
        n1404) );
  AO22X1 U1884 ( .A0(median_out[7]), .A1(n890), .B0(median_out[6]), .B1(n1925), 
        .Y(n1408) );
  OAI22X1 U1885 ( .A0(n945), .A1(n1408), .B0(median_out[7]), .B1(n890), .Y(
        n948) );
  NAND2X1 U1886 ( .A(n2123), .B(ftr_cnt[1]), .Y(n1371) );
  NOR2X1 U1887 ( .A(n1371), .B(n946), .Y(n1358) );
  OA21X4 U1888 ( .A0(n1344), .A1(n948), .B0(n1031), .Y(n1328) );
  OAI31X1 U1889 ( .A0(n951), .A1(n950), .A2(n949), .B0(n2043), .Y(n952) );
  OAI21XL U1890 ( .A0(n957), .A1(n2070), .B0(n956), .Y(n1438) );
  AOI2BB2X1 U1891 ( .B0(median_out[21]), .B1(n1943), .A0N(n2075), .A1N(n8450), 
        .Y(n1442) );
  OAI22XL U1892 ( .A0(median_out[18]), .A1(n958), .B0(median_out[19]), .B1(
        n1941), .Y(n1441) );
  AOI2BB2X1 U1893 ( .B0(n2071), .B1(n1178), .A0N(median_out[22]), .A1N(n1944), 
        .Y(n959) );
  OAI31XL U1894 ( .A0(n960), .A1(median_out[20]), .A2(n1942), .B0(n959), .Y(
        n1440) );
  AO22X1 U1895 ( .A0(median_out[23]), .A1(n853), .B0(median_out[22]), .B1(
        n1944), .Y(n1444) );
  OAI22X1 U1896 ( .A0(n962), .A1(n1444), .B0(median_out[23]), .B1(n853), .Y(
        n964) );
  OA21X4 U1897 ( .A0(n1167), .A1(n964), .B0(n1031), .Y(n970) );
  OAI31X1 U1898 ( .A0(n967), .A1(n966), .A2(n965), .B0(n2043), .Y(n968) );
  NAND2X4 U1899 ( .A(img_data[13]), .B(n978), .Y(n1933) );
  NAND2X4 U1900 ( .A(n978), .B(img_data[12]), .Y(n1932) );
  INVX3 U1901 ( .A(n1930), .Y(n1019) );
  NAND2X2 U1902 ( .A(img_data[8]), .B(n2042), .Y(n1928) );
  AOI2BB1X1 U1903 ( .A0N(n2005), .A1N(n1019), .B0(n973), .Y(n975) );
  OAI22XL U1904 ( .A0(m_reg_g_1__3_), .A1(n1931), .B0(m_reg_g_1__2_), .B1(
        n1930), .Y(n974) );
  OAI22X1 U1905 ( .A0(n975), .A1(n974), .B0(n1003), .B1(n2008), .Y(n976) );
  AOI2BB2X1 U1906 ( .B0(n2012), .B1(n1188), .A0N(n1191), .A1N(n1189), .Y(n979)
         );
  NOR2X2 U1907 ( .A(n979), .B(n1190), .Y(n980) );
  NAND2X4 U1908 ( .A(img_data[15]), .B(n2042), .Y(n1936) );
  OAI2BB2X2 U1909 ( .B0(n980), .B1(n1194), .A0N(n1936), .A1N(m_reg_g_1__7_), 
        .Y(n1025) );
  OA22X1 U1910 ( .A0(m_reg_g_2__6_), .A1(n1934), .B0(m_reg_g_2__7_), .B1(n1936), .Y(n1374) );
  NOR2X1 U1911 ( .A(n1017), .B(n2003), .Y(n986) );
  OAI211X1 U1912 ( .A0(m_reg_g_2__1_), .A1(n1929), .B0(m_reg_g_2__0_), .C0(
        n1928), .Y(n981) );
  OAI21X1 U1913 ( .A0(n1016), .A1(n1973), .B0(n981), .Y(n982) );
  AOI2BB1X1 U1914 ( .A0N(n1975), .A1N(n1019), .B0(n982), .Y(n984) );
  OAI22XL U1915 ( .A0(m_reg_g_2__3_), .A1(n1931), .B0(m_reg_g_2__2_), .B1(
        n1930), .Y(n983) );
  AOI32X1 U1916 ( .A0(n990), .A1(n989), .A2(n988), .B0(n987), .B1(n989), .Y(
        n1373) );
  OA22X1 U1917 ( .A0(m_reg_g_3__6_), .A1(n1934), .B0(m_reg_g_3__7_), .B1(n1936), .Y(n1387) );
  OAI211X1 U1918 ( .A0(m_reg_g_3__1_), .A1(n1929), .B0(m_reg_g_3__0_), .C0(
        n1928), .Y(n991) );
  OAI21X1 U1919 ( .A0(n1016), .A1(n2046), .B0(n991), .Y(n992) );
  AOI2BB1X1 U1920 ( .A0N(n2050), .A1N(n1019), .B0(n992), .Y(n994) );
  OAI22XL U1921 ( .A0(m_reg_g_3__3_), .A1(n1931), .B0(m_reg_g_3__2_), .B1(
        n1930), .Y(n993) );
  NOR2X1 U1922 ( .A(n1017), .B(n1998), .Y(n1007) );
  OAI22X1 U1923 ( .A0(n1005), .A1(n1004), .B0(n1003), .B1(n2000), .Y(n1006) );
  OAI22X1 U1924 ( .A0(m_reg_g_4__4_), .A1(n1932), .B0(n1007), .B1(n1006), .Y(
        n1011) );
  NAND2X1 U1925 ( .A(m_reg_g_4__6_), .B(n1934), .Y(n1010) );
  NAND2X4 U1926 ( .A(n1013), .B(n1135), .Y(n1027) );
  OAI21XL U1927 ( .A0(n1019), .A1(n2064), .B0(n1018), .Y(n1422) );
  AOI2BB2X1 U1928 ( .B0(median_out[13]), .B1(n1933), .A0N(n2011), .A1N(n1017), 
        .Y(n1426) );
  OAI22XL U1929 ( .A0(median_out[10]), .A1(n1020), .B0(median_out[11]), .B1(
        n1931), .Y(n1425) );
  AOI2BB2X1 U1930 ( .B0(n2055), .B1(n1188), .A0N(median_out[14]), .A1N(n1934), 
        .Y(n1021) );
  OAI31XL U1931 ( .A0(n1022), .A1(median_out[12]), .A2(n1932), .B0(n1021), .Y(
        n1424) );
  AO22X1 U1932 ( .A0(median_out[15]), .A1(n1936), .B0(median_out[14]), .B1(
        n1934), .Y(n1428) );
  OAI22X1 U1933 ( .A0(n1024), .A1(n1428), .B0(median_out[15]), .B1(n1936), .Y(
        n1026) );
  OAI31X1 U1934 ( .A0(n1029), .A1(n1028), .A2(n1027), .B0(n2043), .Y(n1030) );
  OAI222X1 U1935 ( .A0(n1032), .A1(n2008), .B0(n2089), .B1(n1033), .C0(n1931), 
        .C1(n1034), .Y(n752) );
  OAI222X1 U1936 ( .A0(n1032), .A1(n2107), .B0(n2033), .B1(n1033), .C0(n1928), 
        .C1(n1034), .Y(n755) );
  OAI222X1 U1937 ( .A0(n1032), .A1(n2101), .B0(n2027), .B1(n1033), .C0(n1934), 
        .C1(n1034), .Y(n749) );
  OAI222X1 U1938 ( .A0(n1032), .A1(n2005), .B0(n2064), .B1(n1033), .C0(n1930), 
        .C1(n1034), .Y(n753) );
  OAI222X1 U1939 ( .A0(n1034), .A1(n1936), .B0(n2083), .B1(n1033), .C0(n2020), 
        .C1(n1032), .Y(n748) );
  OAI222X1 U1940 ( .A0(n1034), .A1(n1933), .B0(n2055), .B1(n1033), .C0(n2012), 
        .C1(n1032), .Y(n750) );
  OAI222X1 U1941 ( .A0(n1034), .A1(n1929), .B0(n2065), .B1(n1033), .C0(n1996), 
        .C1(n1032), .Y(n754) );
  OAI222X1 U1942 ( .A0(n1034), .A1(n1932), .B0(n2011), .B1(n1033), .C0(n2068), 
        .C1(n1032), .Y(n751) );
  NOR2X1 U1943 ( .A(n1035), .B(n2045), .Y(n1892) );
  OAI22XL U1944 ( .A0(n1038), .A1(n1098), .B0(n1037), .B1(n1893), .Y(n1039) );
  OAI21XL U1945 ( .A0(n1043), .A1(n1258), .B0(n1042), .Y(n1044) );
  NOR2X1 U1946 ( .A(n1986), .B(n2044), .Y(n1242) );
  CLKINVX1 U1947 ( .A(n1242), .Y(n1901) );
  NOR2X1 U1948 ( .A(n1986), .B(DP_OP_307_134_2203_n256), .Y(n1081) );
  NOR2X1 U1949 ( .A(n1472), .B(n1901), .Y(n1903) );
  OAI22XL U1950 ( .A0(n1078), .A1(n1988), .B0(n2040), .B1(n1901), .Y(n1083) );
  OAI22XL U1951 ( .A0(n1902), .A1(n1098), .B0(n1971), .B1(n1107), .Y(n1100) );
  AO21X1 U1952 ( .A0(n1904), .A1(n1100), .B0(n1099), .Y(n1101) );
  OAI21XL U1953 ( .A0(n1987), .A1(n1107), .B0(n1106), .Y(n1108) );
  AO22X2 U1954 ( .A0(n1120), .A1(n1917), .B0(n1916), .B1(dsp_pos[6]), .Y(
        mem_addr[6]) );
  NOR3XL U1955 ( .A(n814), .B(ftr_cnt[1]), .C(ftr_cnt[0]), .Y(N531) );
  OAI222XL U1956 ( .A0(n1167), .A1(n2013), .B0(n2066), .B1(n1166), .C0(n1941), 
        .C1(n1165), .Y(N626) );
  OAI222XL U1957 ( .A0(n1167), .A1(n2108), .B0(n2031), .B1(n1166), .C0(n1944), 
        .C1(n1165), .Y(N629) );
  OAI222XL U1958 ( .A0(n1165), .A1(n1943), .B0(n2099), .B1(n1166), .C0(n2016), 
        .C1(n1167), .Y(N628) );
  OAI222XL U1959 ( .A0(n1169), .A1(n2028), .B0(n2095), .B1(n912), .C0(n1925), 
        .C1(n1168), .Y(N829) );
  NAND2X2 U1960 ( .A(n1125), .B(n1945), .Y(n1170) );
  OAI222XL U1961 ( .A0(n1172), .A1(n2021), .B0(n2081), .B1(n1171), .C0(n853), 
        .C1(n1170), .Y(N614) );
  OAI222XL U1962 ( .A0(n1172), .A1(n1980), .B0(n2097), .B1(n1171), .C0(n1944), 
        .C1(n1170), .Y(N613) );
  OAI222XL U1963 ( .A0(n1172), .A1(n2025), .B0(n2094), .B1(n1171), .C0(n1943), 
        .C1(n1170), .Y(N612) );
  OAI222XL U1964 ( .A0(n1175), .A1(n2087), .B0(n2021), .B1(n1174), .C0(n853), 
        .C1(n1173), .Y(N622) );
  OAI222XL U1965 ( .A0(n1175), .A1(n2099), .B0(n2025), .B1(n1174), .C0(n1943), 
        .C1(n1173), .Y(N620) );
  OAI222XL U1966 ( .A0(n1175), .A1(n2031), .B0(n1980), .B1(n1174), .C0(n1944), 
        .C1(n1173), .Y(N621) );
  OAI222XL U1967 ( .A0(n1337), .A1(n1981), .B0(n2096), .B1(n1131), .C0(n1934), 
        .C1(n1336), .Y(N721) );
  NAND2X2 U1968 ( .A(n1132), .B(n2043), .Y(n1233) );
  OAI222XL U1969 ( .A0(n1233), .A1(n1929), .B0(n1973), .B1(n1234), .C0(n1996), 
        .C1(n1235), .Y(N732) );
  OAI222XL U1970 ( .A0(n1165), .A1(n1939), .B0(n2054), .B1(n1166), .C0(n2006), 
        .C1(n1167), .Y(N624) );
  OAI222XL U1971 ( .A0(n1169), .A1(n2051), .B0(n1993), .B1(n912), .C0(n1921), 
        .C1(n1168), .Y(N825) );
  OAI222XL U1972 ( .A0(n1169), .A1(n2048), .B0(n1992), .B1(n912), .C0(n1920), 
        .C1(n1168), .Y(N824) );
  OAI222XL U1973 ( .A0(n1172), .A1(n2001), .B0(n2056), .B1(n1171), .C0(n1941), 
        .C1(n1170), .Y(N610) );
  OAI222XL U1974 ( .A0(n1172), .A1(n1995), .B0(n2049), .B1(n1171), .C0(n1940), 
        .C1(n1170), .Y(N609) );
  OAI222XL U1975 ( .A0(n1172), .A1(n1991), .B0(n2047), .B1(n1171), .C0(n1939), 
        .C1(n1170), .Y(N608) );
  OAI222XL U1976 ( .A0(n1175), .A1(n2066), .B0(n2001), .B1(n1174), .C0(n1941), 
        .C1(n1173), .Y(N618) );
  OAI222XL U1977 ( .A0(n1337), .A1(n2046), .B0(n1989), .B1(n1131), .C0(n1929), 
        .C1(n1336), .Y(N716) );
  OAI222XL U1978 ( .A0(n1337), .A1(n2023), .B0(n2080), .B1(n1131), .C0(n1936), 
        .C1(n1336), .Y(N722) );
  NAND2X2 U1979 ( .A(n1139), .B(n1138), .Y(n1338) );
  OAI222XL U1980 ( .A0(n1340), .A1(n2030), .B0(n1981), .B1(n1339), .C0(n1934), 
        .C1(n1338), .Y(N729) );
  NAND2X2 U1981 ( .A(n1145), .B(n1144), .Y(n1341) );
  OAI222XL U1982 ( .A0(n1343), .A1(n1979), .B0(n2028), .B1(n1342), .C0(n1925), 
        .C1(n1341), .Y(N837) );
  OAI222XL U1983 ( .A0(n1343), .A1(n2084), .B0(n2018), .B1(n1342), .C0(n890), 
        .C1(n1341), .Y(N838) );
  ADDFXL U1984 ( .A(n1148), .B(n1147), .CI(n1146), .CO(n1153), .S(n1149) );
  AO22X1 U1985 ( .A0(n1149), .A1(n1917), .B0(n1916), .B1(dsp_pos[0]), .Y(
        mem_addr[0]) );
  AO22X1 U1986 ( .A0(n1155), .A1(n1917), .B0(n1916), .B1(dsp_pos[1]), .Y(
        mem_addr[1]) );
  OAI222XL U1987 ( .A0(n1165), .A1(n1942), .B0(n2067), .B1(n1166), .C0(n2014), 
        .C1(n1167), .Y(N627) );
  OAI222XL U1988 ( .A0(n1167), .A1(n2009), .B0(n2062), .B1(n1166), .C0(n1940), 
        .C1(n1165), .Y(N625) );
  OAI222XL U1989 ( .A0(n1167), .A1(n2109), .B0(n2036), .B1(n1166), .C0(n1938), 
        .C1(n1165), .Y(N623) );
  OAI222XL U1990 ( .A0(n1169), .A1(n2060), .B0(n1994), .B1(n912), .C0(n1922), 
        .C1(n1168), .Y(N826) );
  OAI222XL U1991 ( .A0(n1169), .A1(n2034), .B0(n2104), .B1(n912), .C0(n1919), 
        .C1(n1168), .Y(N823) );
  OAI222XL U1992 ( .A0(n1169), .A1(n2024), .B0(n2092), .B1(n912), .C0(n1924), 
        .C1(n1168), .Y(N828) );
  OAI222XL U1993 ( .A0(n1169), .A1(n2061), .B0(n1997), .B1(n912), .C0(n1923), 
        .C1(n1168), .Y(N827) );
  OAI222XL U1994 ( .A0(n1172), .A1(n2002), .B0(n2052), .B1(n1171), .C0(n1942), 
        .C1(n1170), .Y(N611) );
  OAI222XL U1995 ( .A0(n1172), .A1(n1983), .B0(n2103), .B1(n1171), .C0(n1938), 
        .C1(n1170), .Y(N607) );
  OAI222XL U1996 ( .A0(n1175), .A1(n2062), .B0(n1995), .B1(n1174), .C0(n1940), 
        .C1(n1173), .Y(N617) );
  OAI222XL U1997 ( .A0(n1175), .A1(n2054), .B0(n1991), .B1(n1174), .C0(n1939), 
        .C1(n1173), .Y(N616) );
  OAI222XL U1998 ( .A0(n1175), .A1(n2067), .B0(n2002), .B1(n1174), .C0(n1942), 
        .C1(n1173), .Y(N619) );
  OAI222XL U1999 ( .A0(n1175), .A1(n2036), .B0(n1983), .B1(n1174), .C0(n1938), 
        .C1(n1173), .Y(N615) );
  OAI222XL U2000 ( .A0(n1337), .A1(n2050), .B0(n1990), .B1(n1131), .C0(n1930), 
        .C1(n1336), .Y(N717) );
  OAI222XL U2001 ( .A0(n1337), .A1(n2059), .B0(n1998), .B1(n1131), .C0(n1932), 
        .C1(n1336), .Y(N719) );
  OAI222XL U2002 ( .A0(n1340), .A1(n2085), .B0(n2023), .B1(n1339), .C0(n1936), 
        .C1(n1338), .Y(N730) );
  OAI222XL U2003 ( .A0(n1340), .A1(n1975), .B0(n2050), .B1(n1339), .C0(n1930), 
        .C1(n1338), .Y(N725) );
  OAI222XL U2004 ( .A0(n1340), .A1(n1973), .B0(n2046), .B1(n1339), .C0(n1929), 
        .C1(n1338), .Y(N724) );
  OAI222XL U2005 ( .A0(n1343), .A1(n1972), .B0(n2048), .B1(n1342), .C0(n1920), 
        .C1(n1341), .Y(N832) );
  OAI222XL U2006 ( .A0(n1343), .A1(n1974), .B0(n2051), .B1(n1342), .C0(n1921), 
        .C1(n1341), .Y(N833) );
  NAND2X2 U2007 ( .A(n1176), .B(n2043), .Y(n1346) );
  OAI222XL U2008 ( .A0(n1346), .A1(n1920), .B0(n1972), .B1(n1345), .C0(n1999), 
        .C1(n1344), .Y(N840) );
  OAI222XL U2009 ( .A0(n1346), .A1(n890), .B0(n2084), .B1(n1345), .C0(n2019), 
        .C1(n1344), .Y(N846) );
  NAND2XL U2010 ( .A(n1178), .B(n2016), .Y(n1182) );
  NAND2X1 U2011 ( .A(n1184), .B(n853), .Y(n1449) );
  AOI2BB2X1 U2012 ( .B0(n1347), .B1(N427), .A0N(n2017), .A1N(n1449), .Y(n1185)
         );
  OAI31XL U2013 ( .A0(n1187), .A1(n1186), .A2(n1230), .B0(n1185), .Y(N451) );
  NAND2XL U2014 ( .A(n1188), .B(n2012), .Y(n1192) );
  NAND2X1 U2015 ( .A(n1184), .B(n1936), .Y(n1433) );
  AOI2BB2X1 U2016 ( .B0(n1347), .B1(N435), .A0N(n2020), .A1N(n1433), .Y(n1193)
         );
  OAI31XL U2017 ( .A0(n1195), .A1(n1194), .A2(n1230), .B0(n1193), .Y(N459) );
  NOR2X1 U2018 ( .A(n2058), .B(n1311), .Y(n1959) );
  NOR2BX1 U2019 ( .AN(dsp_pos[6]), .B(n1313), .Y(n1414) );
  NAND2X1 U2020 ( .A(n786), .B(n1916), .Y(n1483) );
  OA21XL U2021 ( .A0(n1314), .A1(n1414), .B0(n1483), .Y(n1417) );
  OAI22XL U2022 ( .A0(n1416), .A1(n1196), .B0(n1417), .B1(n2077), .Y(n770) );
  AOI222XL U2023 ( .A0(n1472), .A1(out_data_r[7]), .B0(n1220), .B1(census[7]), 
        .C0(n1221), .C1(median_out[7]), .Y(n1197) );
  CLKINVX1 U2024 ( .A(n1197), .Y(o_out_data[7]) );
  AOI222XL U2025 ( .A0(n1472), .A1(out_data_r[15]), .B0(n1221), .B1(
        median_out[15]), .C0(census[15]), .C1(n1220), .Y(n1198) );
  CLKINVX1 U2026 ( .A(n1198), .Y(o_out_data[15]) );
  OAI222XL U2027 ( .A0(n1235), .A1(n2107), .B0(n2035), .B1(n1234), .C0(n1928), 
        .C1(n1233), .Y(N731) );
  AOI222XL U2028 ( .A0(n1472), .A1(out_data_r[1]), .B0(n1220), .B1(N444), .C0(
        n1221), .C1(median_out[1]), .Y(n1199) );
  CLKINVX1 U2029 ( .A(n1199), .Y(o_out_data[1]) );
  AOI222XL U2030 ( .A0(n1472), .A1(out_data_r[20]), .B0(n1220), .B1(N431), 
        .C0(n1221), .C1(median_out[20]), .Y(n1200) );
  CLKINVX1 U2031 ( .A(n1200), .Y(o_out_data[20]) );
  AOI222XL U2032 ( .A0(n1472), .A1(out_data_r[22]), .B0(n1220), .B1(N429), 
        .C0(n1221), .C1(median_out[22]), .Y(n1201) );
  CLKINVX1 U2033 ( .A(n1201), .Y(o_out_data[22]) );
  AOI222XL U2034 ( .A0(n1472), .A1(out_data_r[9]), .B0(n1220), .B1(N436), .C0(
        n1221), .C1(median_out[9]), .Y(n1202) );
  CLKINVX1 U2035 ( .A(n1202), .Y(o_out_data[9]) );
  AOI222XL U2036 ( .A0(n1472), .A1(out_data_r[18]), .B0(n1220), .B1(N430), 
        .C0(n1221), .C1(median_out[18]), .Y(n1203) );
  CLKINVX1 U2037 ( .A(n1203), .Y(o_out_data[18]) );
  AOI222XL U2038 ( .A0(n1472), .A1(out_data_r[17]), .B0(n1220), .B1(N428), 
        .C0(n1221), .C1(median_out[17]), .Y(n1204) );
  CLKINVX1 U2039 ( .A(n1204), .Y(o_out_data[17]) );
  AOI222XL U2040 ( .A0(n1472), .A1(out_data_r[14]), .B0(n1220), .B1(N437), 
        .C0(n1221), .C1(median_out[14]), .Y(n1205) );
  CLKINVX1 U2041 ( .A(n1205), .Y(o_out_data[14]) );
  AOI222XL U2042 ( .A0(n1472), .A1(out_data_r[2]), .B0(n1220), .B1(N446), .C0(
        n1221), .C1(median_out[2]), .Y(n1206) );
  CLKINVX1 U2043 ( .A(n1206), .Y(o_out_data[2]) );
  AOI222XL U2044 ( .A0(n1472), .A1(out_data_r[4]), .B0(n1220), .B1(N447), .C0(
        n1221), .C1(median_out[4]), .Y(n1207) );
  CLKINVX1 U2045 ( .A(n1207), .Y(o_out_data[4]) );
  AOI222XL U2046 ( .A0(n1472), .A1(out_data_r[12]), .B0(n1220), .B1(N439), 
        .C0(n1221), .C1(median_out[12]), .Y(n1208) );
  CLKINVX1 U2047 ( .A(n1208), .Y(o_out_data[12]) );
  AOI222XL U2048 ( .A0(n1472), .A1(out_data_r[10]), .B0(n1220), .B1(N438), 
        .C0(n1221), .C1(median_out[10]), .Y(n1209) );
  CLKINVX1 U2049 ( .A(n1209), .Y(o_out_data[10]) );
  AOI222XL U2050 ( .A0(n1472), .A1(out_data_r[6]), .B0(n1220), .B1(N445), .C0(
        n1221), .C1(median_out[6]), .Y(n1210) );
  CLKINVX1 U2051 ( .A(n1210), .Y(o_out_data[6]) );
  AOI222XL U2052 ( .A0(n1472), .A1(out_data_r[23]), .B0(n1220), .B1(census[23]), .C0(n1221), .C1(median_out[23]), .Y(n1211) );
  CLKINVX1 U2053 ( .A(n1211), .Y(o_out_data[23]) );
  AOI222XL U2054 ( .A0(n1472), .A1(out_data_r[21]), .B0(median_out[21]), .B1(
        n1221), .C0(N427), .C1(n1220), .Y(n1212) );
  CLKINVX1 U2055 ( .A(n1212), .Y(o_out_data[21]) );
  AOI222XL U2056 ( .A0(n1472), .A1(out_data_r[11]), .B0(median_out[11]), .B1(
        n1221), .C0(N434), .C1(n1220), .Y(n1213) );
  CLKINVX1 U2057 ( .A(n1213), .Y(o_out_data[11]) );
  AOI222XL U2058 ( .A0(n1472), .A1(out_data_r[13]), .B0(median_out[13]), .B1(
        n1221), .C0(N435), .C1(n1220), .Y(n1214) );
  CLKINVX1 U2059 ( .A(n1214), .Y(o_out_data[13]) );
  AOI222XL U2060 ( .A0(n1472), .A1(out_data_r[19]), .B0(median_out[19]), .B1(
        n1221), .C0(N426), .C1(n1220), .Y(n1215) );
  CLKINVX1 U2061 ( .A(n1215), .Y(o_out_data[19]) );
  AOI222XL U2062 ( .A0(n1472), .A1(out_data_r[8]), .B0(median_out[8]), .B1(
        n1221), .C0(N433), .C1(n1220), .Y(n1216) );
  CLKINVX1 U2063 ( .A(n1216), .Y(o_out_data[8]) );
  AOI222XL U2064 ( .A0(n1472), .A1(out_data_r[0]), .B0(median_out[0]), .B1(
        n1221), .C0(N441), .C1(n1220), .Y(n1217) );
  CLKINVX1 U2065 ( .A(n1217), .Y(o_out_data[0]) );
  AOI222XL U2066 ( .A0(n1472), .A1(out_data_r[3]), .B0(median_out[3]), .B1(
        n1221), .C0(N442), .C1(n1220), .Y(n1218) );
  CLKINVX1 U2067 ( .A(n1218), .Y(o_out_data[3]) );
  AOI222XL U2068 ( .A0(n1472), .A1(out_data_r[16]), .B0(median_out[16]), .B1(
        n1221), .C0(N425), .C1(n1220), .Y(n1219) );
  CLKINVX1 U2069 ( .A(n1219), .Y(o_out_data[16]) );
  AOI222XL U2070 ( .A0(n1472), .A1(out_data_r[5]), .B0(median_out[5]), .B1(
        n1221), .C0(N443), .C1(n1220), .Y(n1222) );
  CLKINVX1 U2071 ( .A(n1222), .Y(o_out_data[5]) );
  OAI222XL U2072 ( .A0(n1337), .A1(n1985), .B0(n2102), .B1(n1131), .C0(n1928), 
        .C1(n1336), .Y(N715) );
  OAI222XL U2073 ( .A0(n1344), .A1(n2004), .B0(n1974), .B1(n1345), .C0(n1921), 
        .C1(n1346), .Y(N841) );
  OAI222XL U2074 ( .A0(n1344), .A1(n2100), .B0(n1979), .B1(n1345), .C0(n1925), 
        .C1(n1346), .Y(N845) );
  AO22X2 U2075 ( .A0(n1228), .A1(n1917), .B0(n1916), .B1(dsp_pos[5]), .Y(
        mem_addr[5]) );
  NAND2X1 U2076 ( .A(n1184), .B(n890), .Y(n1413) );
  AOI2BB2X1 U2077 ( .B0(n1347), .B1(N443), .A0N(n2019), .A1N(n1413), .Y(n1229)
         );
  OAI31XL U2078 ( .A0(n1232), .A1(n1231), .A2(n1230), .B0(n1229), .Y(N467) );
  OAI222XL U2079 ( .A0(n1235), .A1(n2008), .B0(n1977), .B1(n1234), .C0(n1931), 
        .C1(n1233), .Y(N734) );
  OAI222XL U2080 ( .A0(n1340), .A1(n2003), .B0(n2059), .B1(n1339), .C0(n1932), 
        .C1(n1338), .Y(N727) );
  OAI222XL U2081 ( .A0(n1343), .A1(n1978), .B0(n2061), .B1(n1342), .C0(n1923), 
        .C1(n1341), .Y(N835) );
  OAI222XL U2082 ( .A0(n1346), .A1(n1923), .B0(n1978), .B1(n1345), .C0(n2010), 
        .C1(n1344), .Y(N843) );
  OAI222XL U2083 ( .A0(n1344), .A1(n2007), .B0(n1976), .B1(n1345), .C0(n1922), 
        .C1(n1346), .Y(N842) );
  OAI222XL U2084 ( .A0(n1344), .A1(n2106), .B0(n1982), .B1(n1345), .C0(n1919), 
        .C1(n1346), .Y(N839) );
  CLKBUFX3 U2085 ( .A(i_rst_n), .Y(n2112) );
  CLKBUFX3 U2086 ( .A(i_rst_n), .Y(n2111) );
  CLKBUFX3 U2087 ( .A(i_rst_n), .Y(n2110) );
  CLKBUFX3 U2088 ( .A(i_rst_n), .Y(n2118) );
  CLKBUFX3 U2089 ( .A(i_rst_n), .Y(n2119) );
  CLKBUFX3 U2090 ( .A(i_rst_n), .Y(n2113) );
  CLKBUFX3 U2091 ( .A(i_rst_n), .Y(n2114) );
  CLKBUFX3 U2092 ( .A(i_rst_n), .Y(n2120) );
  CLKBUFX3 U2093 ( .A(i_rst_n), .Y(n2117) );
  CLKBUFX3 U2094 ( .A(i_rst_n), .Y(n2115) );
  CLKBUFX3 U2095 ( .A(i_rst_n), .Y(n2116) );
  NOR2X1 U2096 ( .A(n1371), .B(n1236), .Y(n1377) );
  NOR4XL U2097 ( .A(n1957), .B(dsp_pos[5]), .C(dsp_pos[7]), .D(dsp_pos[6]), 
        .Y(n1239) );
  OAI21XL U2098 ( .A0(img_size_r[4]), .A1(dsp_pos[4]), .B0(n1893), .Y(n1238)
         );
  NAND2BX1 U2099 ( .AN(n1470), .B(n1904), .Y(n1459) );
  OAI21XL U2100 ( .A0(n1354), .A1(n1472), .B0(n1459), .Y(valid_w) );
  NAND2XL U2101 ( .A(img_pos[6]), .B(img_pos[7]), .Y(n1243) );
  OAI21XL U2102 ( .A0(img_pos[5]), .A1(n1895), .B0(img_pos[4]), .Y(n1241) );
  OAI21XL U2103 ( .A0(n1242), .A1(n2053), .B0(n1241), .Y(n1247) );
  OAI21XL U2104 ( .A0(img_pos[1]), .A1(n1895), .B0(img_pos[0]), .Y(n1244) );
  AOI222XL U2105 ( .A0(n1248), .A1(n1894), .B0(n1247), .B1(n1509), .C0(n1246), 
        .C1(n1507), .Y(n1257) );
  NAND2X1 U2106 ( .A(n1249), .B(n2043), .Y(n1515) );
  NAND2BX1 U2107 ( .AN(n1257), .B(n1256), .Y(n1254) );
  NOR2BX2 U2108 ( .AN(cstate[2]), .B(cstate[3]), .Y(n1514) );
  NAND4XL U2109 ( .A(cstate[0]), .B(cstate[2]), .C(cstate[3]), .D(n2043), .Y(
        n1474) );
  OAI31XL U2110 ( .A0(cstate[0]), .A1(n2043), .A2(n1250), .B0(n1474), .Y(n1458) );
  NAND4BX1 U2111 ( .AN(n1458), .B(n1252), .C(n1461), .D(n1464), .Y(n1517) );
  CLKINVX1 U2112 ( .A(n1269), .Y(n1350) );
  CLKINVX1 U2113 ( .A(n1255), .Y(n1271) );
  OAI22XL U2114 ( .A0(n2086), .A1(n1350), .B0(n1271), .B1(n2022), .Y(n769) );
  OAI222XL U2115 ( .A0(n8360), .A1(n1271), .B0(n1986), .B1(n1350), .C0(n2044), 
        .C1(n1268), .Y(n766) );
  OAI222XL U2116 ( .A0(n2022), .A1(n1268), .B0(n2044), .B1(n1350), .C0(n1271), 
        .C1(n1986), .Y(n767) );
  OR2X2 U2117 ( .A(img_data[8]), .B(img_data[17]), .Y(n1261) );
  AO22X1 U2118 ( .A0(img_data[16]), .A1(n1259), .B0(n1260), .B1(n1267), .Y(
        out_data[16]) );
  AOI2BB2X1 U2119 ( .B0(img_size_r[1]), .B1(n1269), .A0N(n2086), .A1N(n1268), 
        .Y(n1270) );
  OAI31XL U2120 ( .A0(n1272), .A1(n2044), .A2(n1271), .B0(n1270), .Y(n768) );
  XNOR2X1 U2121 ( .A(n1278), .B(n1277), .Y(n1279) );
  AO22X1 U2122 ( .A0(img_data[17]), .A1(n1259), .B0(n1260), .B1(n1279), .Y(
        out_data[17]) );
  AO22X1 U2123 ( .A0(img_data[18]), .A1(n1259), .B0(n1260), .B1(n1291), .Y(
        out_data[18]) );
  XNOR2X1 U2124 ( .A(n1301), .B(n1297), .Y(n1298) );
  AO22X1 U2125 ( .A0(img_data[19]), .A1(n1259), .B0(n1260), .B1(n1298), .Y(
        out_data[19]) );
  AO22X1 U2126 ( .A0(img_data[20]), .A1(n1259), .B0(n1260), .B1(n1306), .Y(
        out_data[20]) );
  NAND2XL U2127 ( .A(dsp_pos[1]), .B(dsp_pos[0]), .Y(n1309) );
  OAI21XL U2128 ( .A0(dsp_pos[0]), .A1(n1314), .B0(n1483), .Y(n1953) );
  OAI21XL U2129 ( .A0(n1952), .A1(n1953), .B0(n1307), .Y(n1308) );
  OAI31XL U2130 ( .A0(n1314), .A1(n1984), .A2(n1309), .B0(n1308), .Y(n775) );
  OAI21XL U2131 ( .A0(n1314), .A1(n1955), .B0(n1483), .Y(n1956) );
  OAI21XL U2132 ( .A0(n1954), .A1(n1956), .B0(dsp_pos[4]), .Y(n1310) );
  OAI31XL U2133 ( .A0(dsp_pos[4]), .A1(n1314), .A2(n1311), .B0(n1310), .Y(n773) );
  OAI21XL U2134 ( .A0(n1314), .A1(n1959), .B0(n1483), .Y(n1960) );
  OAI21XL U2135 ( .A0(n1958), .A1(n1960), .B0(dsp_pos[6]), .Y(n1312) );
  OAI31XL U2136 ( .A0(dsp_pos[6]), .A1(n1314), .A2(n1313), .B0(n1312), .Y(n771) );
  AO22X1 U2137 ( .A0(img_data[21]), .A1(n1259), .B0(n1260), .B1(n1321), .Y(
        out_data[21]) );
  AO22X1 U2138 ( .A0(img_data[23]), .A1(n1259), .B0(n1260), .B1(n1326), .Y(
        out_data[23]) );
  AO22X1 U2139 ( .A0(img_data[22]), .A1(n1259), .B0(n1260), .B1(n1335), .Y(
        out_data[22]) );
  OAI222XL U2140 ( .A0(n1337), .A1(n2029), .B0(n2093), .B1(n1131), .C0(n1933), 
        .C1(n1336), .Y(N720) );
  OAI222XL U2141 ( .A0(n1340), .A1(n2035), .B0(n1985), .B1(n1339), .C0(n1928), 
        .C1(n1338), .Y(N723) );
  OAI222XL U2142 ( .A0(n1340), .A1(n2091), .B0(n2029), .B1(n1339), .C0(n1933), 
        .C1(n1338), .Y(N728) );
  OAI222XL U2143 ( .A0(n1340), .A1(n1977), .B0(n2057), .B1(n1339), .C0(n1931), 
        .C1(n1338), .Y(N726) );
  OAI222XL U2144 ( .A0(n1343), .A1(n1982), .B0(n2034), .B1(n1342), .C0(n1919), 
        .C1(n1341), .Y(N831) );
  OAI222XL U2145 ( .A0(n1343), .A1(n2090), .B0(n2024), .B1(n1342), .C0(n1924), 
        .C1(n1341), .Y(N836) );
  OAI222XL U2146 ( .A0(n1343), .A1(n1976), .B0(n2060), .B1(n1342), .C0(n1922), 
        .C1(n1341), .Y(N834) );
  OAI222XL U2147 ( .A0(n1346), .A1(n1924), .B0(n2090), .B1(n1345), .C0(n2015), 
        .C1(n1344), .Y(N844) );
  AND2X1 U2148 ( .A(n1347), .B(N439), .Y(N463) );
  AND2X1 U2149 ( .A(n1347), .B(N429), .Y(N453) );
  AND2X1 U2150 ( .A(n1347), .B(N437), .Y(N461) );
  AND2X1 U2151 ( .A(n1347), .B(N431), .Y(N455) );
  AND2X1 U2152 ( .A(n1347), .B(N438), .Y(N462) );
  AND2X1 U2153 ( .A(n1347), .B(N430), .Y(N454) );
  OAI21XL U2157 ( .A0(n1356), .A1(ftr_col[0]), .B0(n1385), .Y(n1357) );
  OAI21XL U2158 ( .A0(n1381), .A1(ftr_row[0]), .B0(n1377), .Y(n1360) );
  OAI21XL U2159 ( .A0(n1377), .A1(ftr_row[0]), .B0(n1360), .Y(n1361) );
  NAND3XL U2160 ( .A(n1184), .B(n1367), .C(n1366), .Y(n1369) );
  AOI2BB1X1 U2161 ( .A0N(ftr_cnt2[1]), .A1N(ftr_cnt2[0]), .B0(n1371), .Y(n1370) );
  NOR2X1 U2162 ( .A(DP_OP_284J1_122_4910_n165), .B(n1385), .Y(n1384) );
  NAND3XL U2163 ( .A(n1184), .B(n1374), .C(n1373), .Y(n1376) );
  NAND2X1 U2164 ( .A(n1377), .B(ftr_row[0]), .Y(n1383) );
  AO21X1 U2165 ( .A0(ftr_row[2]), .A1(ftr_row[1]), .B0(n1381), .Y(n1379) );
  AOI2BB1X1 U2166 ( .A0N(n1383), .A1N(n2122), .B0(ftr_row[2]), .Y(n1378) );
  AOI2BB1X1 U2167 ( .A0N(n1381), .A1N(ftr_row[1]), .B0(n1383), .Y(n1382) );
  NAND3XL U2168 ( .A(n1184), .B(n1391), .C(n1390), .Y(n1393) );
  NAND3XL U2169 ( .A(n1184), .B(n1399), .C(n1398), .Y(n1412) );
  OAI31XL U2170 ( .A0(n1401), .A1(median_out[0]), .A2(n1919), .B0(n1400), .Y(
        n1403) );
  NOR2BX1 U2171 ( .AN(n1403), .B(n1402), .Y(n1407) );
  AOI221XL U2172 ( .A0(n1407), .A1(n1406), .B0(n1405), .B1(n1406), .C0(n1404), 
        .Y(n1409) );
  OAI22XL U2173 ( .A0(median_out[7]), .A1(n890), .B0(n1409), .B1(n1408), .Y(
        n1410) );
  NAND3XL U2174 ( .A(n1184), .B(n1419), .C(n1418), .Y(n1432) );
  OAI31XL U2175 ( .A0(n1421), .A1(median_out[8]), .A2(n1928), .B0(n1420), .Y(
        n1423) );
  NOR2BX1 U2176 ( .AN(n1423), .B(n1422), .Y(n1427) );
  AOI221XL U2177 ( .A0(n1427), .A1(n1426), .B0(n1425), .B1(n1426), .C0(n1424), 
        .Y(n1429) );
  OAI22XL U2178 ( .A0(median_out[15]), .A1(n1936), .B0(n1429), .B1(n1428), .Y(
        n1430) );
  NAND3XL U2179 ( .A(n1184), .B(n1435), .C(n1434), .Y(n1448) );
  OAI31XL U2180 ( .A0(n1437), .A1(median_out[16]), .A2(n1938), .B0(n1436), .Y(
        n1439) );
  NOR2BX1 U2181 ( .AN(n1439), .B(n1438), .Y(n1443) );
  AOI221XL U2182 ( .A0(n1443), .A1(n1442), .B0(n1441), .B1(n1442), .C0(n1440), 
        .Y(n1445) );
  OAI22XL U2183 ( .A0(median_out[23]), .A1(n853), .B0(n1445), .B1(n1444), .Y(
        n1446) );
  OA21XL U2184 ( .A0(n1986), .A1(dsp_pos[5]), .B0(n1454), .Y(n1455) );
  AO21X1 U2185 ( .A0(n1457), .A1(img_size_r[4]), .B0(n2077), .Y(n1456) );
  OAI211X1 U2186 ( .A0(n1457), .A1(img_size_r[4]), .B0(n2078), .C0(n1456), .Y(
        n1471) );
  CLKINVX1 U2187 ( .A(n1461), .Y(n1947) );
  OAI22X1 U2188 ( .A0(i_op_valid), .A1(n1461), .B0(n786), .B1(n1480), .Y(n1951) );
  OAI21XL U2189 ( .A0(n1951), .A1(n1904), .B0(cstate[1]), .Y(n1468) );
  NOR2X1 U2190 ( .A(n1472), .B(n1471), .Y(n1948) );
  OAI21XL U2191 ( .A0(n1904), .A1(n1948), .B0(cstate[3]), .Y(n1473) );
  OAI2BB2X2 U2192 ( .B0(n2058), .B1(n1480), .A0N(n1917), .A1N(n1479), .Y(
        mem_addr[4]) );
  OAI21XL U2193 ( .A0(n1483), .A1(n2040), .B0(n1482), .Y(n777) );
  AND2X2 U2194 ( .A(n1514), .B(n1484), .Y(n1512) );
  NOR2BX1 U2195 ( .AN(cstate[0]), .B(cstate[1]), .Y(n1485) );
  AND2X2 U2196 ( .A(n1514), .B(n1485), .Y(n1502) );
  OR2X4 U2197 ( .A(n1512), .B(n1502), .Y(n1534) );
  NOR2X1 U2198 ( .A(n1508), .B(n1512), .Y(n1490) );
  XOR2X1 U2199 ( .A(n1534), .B(n1488), .Y(n1520) );
  XOR2X1 U2200 ( .A(n1534), .B(n1489), .Y(n1523) );
  XOR2X1 U2201 ( .A(n1534), .B(n1491), .Y(n1537) );
  AND2X2 U2202 ( .A(n1514), .B(n1492), .Y(n1506) );
  NOR2X1 U2203 ( .A(n1502), .B(n1506), .Y(n1495) );
  XOR2X1 U2204 ( .A(n1534), .B(n1493), .Y(n1528) );
  XOR2X1 U2205 ( .A(n1534), .B(n1494), .Y(n1531) );
  NOR2X1 U2206 ( .A(n1495), .B(n2045), .Y(n1496) );
  XOR2X1 U2207 ( .A(n1534), .B(n1496), .Y(n1533) );
  XOR2X1 U2208 ( .A(img_pos[7]), .B(n1534), .Y(n1497) );
  XOR2X1 U2209 ( .A(n1498), .B(n1497), .Y(n1518) );
  OAI22XL U2210 ( .A0(img_pos[4]), .A1(n8360), .B0(img_pos[5]), .B1(n1986), 
        .Y(n1499) );
  OAI21XL U2211 ( .A0(img_size_r[3]), .A1(n2053), .B0(n1499), .Y(n1501) );
  OA21XL U2212 ( .A0(n1501), .A1(n2044), .B0(img_pos[6]), .Y(n1500) );
  OAI22XL U2213 ( .A0(img_pos[2]), .A1(n2044), .B0(img_pos[1]), .B1(n1986), 
        .Y(n1503) );
  OAI21XL U2214 ( .A0(n1504), .A1(n1503), .B0(n1502), .Y(n1505) );
  AO22X1 U2215 ( .A0(n1509), .A1(n1508), .B0(n1507), .B1(n1506), .Y(n1510) );
  AOI211X1 U2216 ( .A0(n1513), .A1(n1512), .B0(n1511), .C0(n1510), .Y(n1516)
         );
  AND2X2 U2217 ( .A(n1516), .B(n1514), .Y(n1539) );
  NAND3BX2 U2218 ( .AN(n1517), .B(n1516), .C(n1515), .Y(n1538) );
  AO22X1 U2219 ( .A0(n1518), .A1(n1539), .B0(n1538), .B1(img_pos[7]), .Y(N406)
         );
  AO22X1 U2220 ( .A0(n1521), .A1(n1539), .B0(n1538), .B1(img_pos[6]), .Y(N405)
         );
  ADDFX1 U2221 ( .A(n1523), .B(img_pos[5]), .CI(n1522), .CO(n1519), .S(n1524)
         );
  AO22X1 U2222 ( .A0(n1524), .A1(n1539), .B0(n1538), .B1(img_pos[5]), .Y(N404)
         );
  ADDFXL U2223 ( .A(n1534), .B(img_pos[3]), .CI(n1525), .CO(n1536), .S(n1526)
         );
  AO22X1 U2224 ( .A0(n1526), .A1(n1539), .B0(n1538), .B1(img_pos[3]), .Y(N402)
         );
  ADDFXL U2225 ( .A(n1528), .B(img_pos[2]), .CI(n1527), .CO(n1525), .S(n1529)
         );
  AO22X1 U2226 ( .A0(n1529), .A1(n1539), .B0(n1538), .B1(img_pos[2]), .Y(N401)
         );
  ADDFXL U2227 ( .A(n1531), .B(img_pos[1]), .CI(n1530), .CO(n1527), .S(n1532)
         );
  AO22X1 U2228 ( .A0(n1532), .A1(n1539), .B0(n1538), .B1(img_pos[1]), .Y(N400)
         );
  ADDFXL U2229 ( .A(img_pos[0]), .B(n1534), .CI(n1533), .CO(n1530), .S(n1535)
         );
  AO22X1 U2230 ( .A0(n1535), .A1(n1539), .B0(n1538), .B1(img_pos[0]), .Y(N399)
         );
  ADDFXL U2231 ( .A(n1537), .B(img_pos[4]), .CI(n1536), .CO(n1522), .S(n1540)
         );
  AO22X1 U2232 ( .A0(n1540), .A1(n1539), .B0(n1538), .B1(img_pos[4]), .Y(N403)
         );
  XNOR2X1 U2233 ( .A(img_data[17]), .B(n1557), .Y(n1541) );
  NOR2X1 U2234 ( .A(n1542), .B(n1541), .Y(n1565) );
  NAND2X1 U2235 ( .A(n1542), .B(n1541), .Y(n1567) );
  OA21XL U2236 ( .A0(n1548), .A1(n1547), .B0(n1546), .Y(n1553) );
  ADDFXL U2237 ( .A(img_data[16]), .B(n1549), .CI(n1637), .CO(n1558), .S(n1550) );
  XOR2X1 U2238 ( .A(n1554), .B(n1556), .Y(n1555) );
  AO22X1 U2239 ( .A0(n1555), .A1(n1260), .B0(n1259), .B1(img_data[0]), .Y(
        out_data[0]) );
  OAI21XL U2240 ( .A0(n1565), .A1(n1556), .B0(n1567), .Y(n1563) );
  OR2X1 U2241 ( .A(img_data[17]), .B(n1557), .Y(n1575) );
  NOR2X1 U2242 ( .A(n1560), .B(n1559), .Y(n1568) );
  NAND2X1 U2243 ( .A(n1560), .B(n1559), .Y(n1566) );
  XNOR2X1 U2244 ( .A(n1563), .B(n1562), .Y(n1564) );
  AO22X1 U2245 ( .A0(n1564), .A1(n1260), .B0(n1259), .B1(img_data[1]), .Y(
        out_data[1]) );
  NOR2X1 U2246 ( .A(n1568), .B(n1565), .Y(n1571) );
  AOI21X1 U2247 ( .A0(n1571), .A1(n1570), .B0(n1569), .Y(n1631) );
  ADDFXL U2248 ( .A(img_data[12]), .B(n1575), .CI(n1574), .CO(n1576), .S(n1560) );
  NOR2X1 U2249 ( .A(n1577), .B(n1576), .Y(n1592) );
  NAND2X1 U2250 ( .A(n1577), .B(n1576), .Y(n1594) );
  XNOR2X1 U2251 ( .A(n1610), .B(n1578), .Y(n1579) );
  AO22X1 U2252 ( .A0(n1579), .A1(n1260), .B0(n1259), .B1(img_data[2]), .Y(
        out_data[2]) );
  AOI21X1 U2253 ( .A0(n1610), .A1(n1581), .B0(n1580), .Y(n1590) );
  ADDFXL U2254 ( .A(img_data[19]), .B(n1583), .CI(n1582), .CO(n1599), .S(n1584) );
  NAND2X1 U2255 ( .A(n1588), .B(n1593), .Y(n1589) );
  XOR2X1 U2256 ( .A(n1590), .B(n1589), .Y(n1591) );
  AO22X1 U2257 ( .A0(n1591), .A1(n1260), .B0(n1259), .B1(img_data[3]), .Y(
        out_data[3]) );
  AOI21X1 U2258 ( .A0(n1610), .A1(n1622), .B0(n1628), .Y(n1604) );
  ADDFXL U2259 ( .A(img_data[20]), .B(n1597), .CI(n1596), .CO(n1612), .S(n1598) );
  NAND2X1 U2260 ( .A(n1601), .B(n1600), .Y(n1624) );
  XOR2X1 U2261 ( .A(n1604), .B(n1603), .Y(n1605) );
  AO22X1 U2262 ( .A0(n1605), .A1(n1260), .B0(n1259), .B1(img_data[4]), .Y(
        out_data[4]) );
  OAI21XL U2263 ( .A0(n1607), .A1(n1621), .B0(n1624), .Y(n1608) );
  ADDFXL U2264 ( .A(img_data[21]), .B(n1614), .CI(n1613), .CO(n1632), .S(n1611) );
  NOR2X1 U2265 ( .A(n1616), .B(n1615), .Y(n1625) );
  AO22X1 U2266 ( .A0(n1620), .A1(n1260), .B0(n1259), .B1(img_data[5]), .Y(
        out_data[5]) );
  NOR2X1 U2267 ( .A(n1621), .B(n1625), .Y(n1627) );
  NAND2X1 U2268 ( .A(n1622), .B(n1627), .Y(n1630) );
  OAI21XL U2269 ( .A0(n1625), .A1(n1624), .B0(n1623), .Y(n1626) );
  OAI21X1 U2270 ( .A0(n1631), .A1(n1630), .B0(n1629), .Y(n1734) );
  ADDFXL U2271 ( .A(img_data[22]), .B(img_data[14]), .CI(n1632), .CO(n1634), 
        .S(n1615) );
  XNOR2X1 U2272 ( .A(n1734), .B(n1635), .Y(n1636) );
  AO22X1 U2273 ( .A0(n1636), .A1(n1260), .B0(n1259), .B1(img_data[6]), .Y(
        out_data[6]) );
  ADDFXL U2274 ( .A(img_data[0]), .B(img_data[18]), .CI(n1646), .CO(n1647), 
        .S(n1642) );
  NOR2X1 U2275 ( .A(n1648), .B(n1647), .Y(n1662) );
  XOR2X1 U2276 ( .A(n1652), .B(n1650), .Y(n1651) );
  AO22X1 U2277 ( .A0(n1651), .A1(n1260), .B0(n1259), .B1(img_data[8]), .Y(
        out_data[8]) );
  OAI21XL U2278 ( .A0(n1652), .A1(n1662), .B0(n1664), .Y(n1660) );
  ADDHXL U2279 ( .A(img_data[1]), .B(n1653), .CO(n1670), .S(n1654) );
  NOR2X1 U2280 ( .A(n1657), .B(n1656), .Y(n1665) );
  XNOR2X1 U2281 ( .A(n1660), .B(n1659), .Y(n1661) );
  AO22X1 U2282 ( .A0(n1661), .A1(n1260), .B0(n1259), .B1(img_data[9]), .Y(
        out_data[9]) );
  OAI21XL U2283 ( .A0(n1665), .A1(n1664), .B0(n1663), .Y(n1666) );
  AOI21X1 U2284 ( .A0(n1668), .A1(n1667), .B0(n1666), .Y(n1725) );
  ADDHXL U2285 ( .A(img_data[2]), .B(n1669), .CO(n1679), .S(n1671) );
  NOR2X1 U2286 ( .A(n1673), .B(n1672), .Y(n1687) );
  NAND2X1 U2287 ( .A(n1673), .B(n1672), .Y(n1689) );
  XNOR2X1 U2288 ( .A(n1704), .B(n1674), .Y(n1675) );
  AO22X1 U2289 ( .A0(n1675), .A1(n1260), .B0(n1259), .B1(img_data[10]), .Y(
        out_data[10]) );
  CLKINVX1 U2290 ( .A(img_data[22]), .Y(n1691) );
  ADDHXL U2291 ( .A(img_data[3]), .B(n1678), .CO(n1692), .S(n1680) );
  ADDFXL U2292 ( .A(n1596), .B(n1680), .CI(n1679), .CO(n1681), .S(n1673) );
  NOR2X1 U2293 ( .A(n1682), .B(n1681), .Y(n1690) );
  XOR2X1 U2294 ( .A(n1685), .B(n1684), .Y(n1686) );
  AO22X1 U2295 ( .A0(n1686), .A1(n1260), .B0(n1259), .B1(img_data[11]), .Y(
        out_data[11]) );
  NOR2X1 U2296 ( .A(n1687), .B(n1690), .Y(n1716) );
  OAI21X1 U2297 ( .A0(n1690), .A1(n1689), .B0(n1688), .Y(n1722) );
  CLKINVX1 U2298 ( .A(img_data[23]), .Y(n1705) );
  ADDHXL U2299 ( .A(img_data[4]), .B(n1691), .CO(n1706), .S(n1693) );
  ADDFXL U2300 ( .A(n1613), .B(n1693), .CI(n1692), .CO(n1694), .S(n1682) );
  NOR2X1 U2301 ( .A(n1695), .B(n1694), .Y(n1715) );
  XOR2X1 U2302 ( .A(n1698), .B(n1697), .Y(n1699) );
  AO22X1 U2303 ( .A0(n1699), .A1(n1260), .B0(n1259), .B1(img_data[12]), .Y(
        out_data[12]) );
  OAI21XL U2304 ( .A0(n1701), .A1(n1715), .B0(n1718), .Y(n1702) );
  ADDHXL U2305 ( .A(img_data[5]), .B(n1705), .CO(n1726), .S(n1707) );
  ADDFXL U2306 ( .A(n1708), .B(n1707), .CI(n1706), .CO(n1709), .S(n1695) );
  NOR2X1 U2307 ( .A(n1710), .B(n1709), .Y(n1719) );
  XOR2X1 U2308 ( .A(n1713), .B(n1712), .Y(n1714) );
  AO22X1 U2309 ( .A0(n1714), .A1(n1260), .B0(n1259), .B1(img_data[13]), .Y(
        out_data[13]) );
  OAI21XL U2310 ( .A0(n1719), .A1(n1718), .B0(n1717), .Y(n1720) );
  OAI21X1 U2311 ( .A0(n1725), .A1(n1724), .B0(n1723), .Y(n1744) );
  ADDFXL U2312 ( .A(img_data[6]), .B(img_data[15]), .CI(n1726), .CO(n1728), 
        .S(n1710) );
  XNOR2X1 U2313 ( .A(n1744), .B(n1729), .Y(n1730) );
  AO22X1 U2314 ( .A0(n1730), .A1(n1260), .B0(n1259), .B1(img_data[14]), .Y(
        out_data[14]) );
  ADDFXL U2315 ( .A(img_data[23]), .B(img_data[15]), .CI(n1708), .CO(n1735), 
        .S(n1633) );
  AO22X1 U2316 ( .A0(n1740), .A1(n1260), .B0(img_data[7]), .B1(n1259), .Y(
        out_data[7]) );
  ADDHXL U2317 ( .A(img_data[7]), .B(n1745), .CO(n1746), .S(n1727) );
  AO22X1 U2319 ( .A0(n1749), .A1(n1260), .B0(n1259), .B1(img_data[15]), .Y(
        out_data[15]) );
  XNOR2X1 U2320 ( .A(n1755), .B(n1751), .Y(n1754) );
  INVXL U2321 ( .A(n1762), .Y(n1769) );
  XNOR2X1 U2322 ( .A(n1779), .B(img_size_r[3]), .Y(n1767) );
  XNOR2X1 U2324 ( .A(n1783), .B(n1768), .Y(n1772) );
  NOR2BX1 U2325 ( .AN(img_size_r[4]), .B(n1804), .Y(n1786) );
  INVXL U2326 ( .A(n1775), .Y(n1777) );
  XNOR2X1 U2328 ( .A(n1831), .B(img_size_r[3]), .Y(n1837) );
  NOR2BX1 U2329 ( .AN(img_size_r[4]), .B(n1835), .Y(n1847) );
  OAI22XL U2333 ( .A0(n2044), .A1(n1877), .B0(n1819), .B1(n1876), .Y(n1878) );
  AOI22XL U2334 ( .A0(n1892), .A1(n1957), .B0(img_size_r[2]), .B1(dsp_pos[1]), 
        .Y(n1900) );
  NAND2XL U2335 ( .A(n1893), .B(n1971), .Y(n1896) );
  AO22X1 U2336 ( .A0(n1896), .A1(n1895), .B0(dsp_pos[5]), .B1(n1894), .Y(n1898) );
  AO21X1 U2337 ( .A0(n1905), .A1(n1904), .B0(n1903), .Y(n1907) );
  OAI22XL U2338 ( .A0(n1926), .A1(n1919), .B0(n1927), .B1(n2104), .Y(N815) );
  OAI22XL U2339 ( .A0(n1926), .A1(n1920), .B0(n1927), .B1(n1992), .Y(N816) );
  OAI22XL U2340 ( .A0(n1926), .A1(n1921), .B0(n1927), .B1(n1993), .Y(N817) );
  OAI22XL U2341 ( .A0(n1926), .A1(n1922), .B0(n1927), .B1(n1994), .Y(N818) );
  OAI22XL U2342 ( .A0(n1926), .A1(n1923), .B0(n1927), .B1(n1997), .Y(N819) );
  OAI22XL U2343 ( .A0(n1926), .A1(n1924), .B0(n1927), .B1(n2092), .Y(N820) );
  OAI22XL U2344 ( .A0(n1926), .A1(n1925), .B0(n1927), .B1(n2095), .Y(N821) );
  OAI21XL U2345 ( .A0(n2079), .A1(n1927), .B0(n890), .Y(N822) );
  OAI22XL U2346 ( .A0(n1935), .A1(n1928), .B0(n1937), .B1(n2102), .Y(N707) );
  OAI22XL U2347 ( .A0(n1935), .A1(n1929), .B0(n1937), .B1(n1989), .Y(N708) );
  OAI22XL U2348 ( .A0(n1935), .A1(n1930), .B0(n1937), .B1(n1990), .Y(N709) );
  OAI22XL U2349 ( .A0(n1935), .A1(n1931), .B0(n1937), .B1(n2000), .Y(N710) );
  OAI22XL U2350 ( .A0(n1935), .A1(n1932), .B0(n1937), .B1(n1998), .Y(N711) );
  OAI22XL U2351 ( .A0(n1935), .A1(n1933), .B0(n1937), .B1(n2093), .Y(N712) );
  OAI22XL U2352 ( .A0(n1935), .A1(n1934), .B0(n1937), .B1(n2096), .Y(N713) );
  OAI21XL U2353 ( .A0(n2080), .A1(n1937), .B0(n1936), .Y(N714) );
  OAI22XL U2354 ( .A0(n1945), .A1(n1938), .B0(n1946), .B1(n2103), .Y(N599) );
  OAI22XL U2355 ( .A0(n1945), .A1(n1939), .B0(n1946), .B1(n2047), .Y(N600) );
  OAI22XL U2356 ( .A0(n1945), .A1(n1940), .B0(n1946), .B1(n2049), .Y(N601) );
  OAI22XL U2357 ( .A0(n1945), .A1(n1941), .B0(n1946), .B1(n2056), .Y(N602) );
  OAI22XL U2358 ( .A0(n1945), .A1(n1942), .B0(n1946), .B1(n2052), .Y(N603) );
  OAI22XL U2359 ( .A0(n1945), .A1(n1943), .B0(n1946), .B1(n2094), .Y(N604) );
  OAI22XL U2360 ( .A0(n1945), .A1(n1944), .B0(n1946), .B1(n2097), .Y(N605) );
  OAI21XL U2361 ( .A0(n2081), .A1(n1946), .B0(n853), .Y(N606) );
  OAI21XL U2362 ( .A0(n1951), .A1(n1950), .B0(n1949), .Y(n778) );
  AO22X1 U2363 ( .A0(dsp_pos[1]), .A1(n1953), .B0(dsp_pos[0]), .B1(n1952), .Y(
        n776) );
  AO22X1 U2364 ( .A0(n1957), .A1(n1956), .B0(n1955), .B1(n1954), .Y(n774) );
  AO22X1 U2365 ( .A0(dsp_pos[5]), .A1(n1960), .B0(n1959), .B1(n1958), .Y(n772)
         );
  DFFQX2 ftr_row_reg_0_ ( .D(N535), .CK(i_clk), .Q(ftr_row[0]) );
  DFFQX2 ftr_col_reg_0_ ( .D(N538), .CK(i_clk), .Q(ftr_col[0]) );
  DFFQX2 ftr_cnt_reg_1_ ( .D(N532), .CK(i_clk), .Q(ftr_cnt[1]) );
  DFFX1 ftr_cnt_reg_0_ ( .D(N531), .CK(i_clk), .Q(ftr_cnt[0]), .QN(n2123) );
  DFFX1 ftr_row_reg_2_ ( .D(N537), .CK(i_clk), .Q(ftr_row[2]), .QN(
        DP_OP_307_134_2203_n256) );
  DFFX1 ftr_col_reg_1_ ( .D(N539), .CK(i_clk), .Q(ftr_col[1]), .QN(
        DP_OP_284J1_122_4910_n165) );
  DFFX1 ftr_col_reg_2_ ( .D(N540), .CK(i_clk), .Q(ftr_col[2]), .QN(
        DP_OP_284J1_122_4910_n150) );
  DFFRX1 counter_r_reg_3_ ( .D(n774), .CK(i_clk), .RN(n2110), .Q(n1957), .QN(
        n1971) );
  DFFRX1 img_origin_r_reg_1_ ( .D(N400), .CK(i_clk), .RN(n2119), .Q(img_pos[1]) );
  CLKINVX1 U1308 ( .A(1'b0), .Y(o_in_ready) );
  CLKBUFX6 U1100 ( .A(n2042), .Y(n978) );
  ADDHXL U1380 ( .A(n1882), .B(n1881), .CO(n1883), .S(n1054) );
  INVX1 U1848 ( .A(n1922), .Y(n925) );
  NOR2X4 U1028 ( .A(n1128), .B(n1125), .Y(n888) );
  INVX1 U1261 ( .A(n1223), .Y(n1478) );
  NOR2X2 U1327 ( .A(n1025), .B(n1027), .Y(n1132) );
  NOR2X6 U1340 ( .A(cstate[1]), .B(n1027), .Y(n1134) );
  NAND4BBX1 U1026 ( .AN(n1862), .BN(n1863), .C(n2127), .D(n1864), .Y(
        ftr_zero_pad_w) );
  XOR2X1 U1074 ( .A(n1761), .B(n806), .Y(n2127) );
  XNOR2X1 U1101 ( .A(n1746), .B(n2128), .Y(n1749) );
  AOI21X1 U1198 ( .A0(n1743), .A1(n1744), .B0(n1742), .Y(n2128) );
  CLKINVX1 U1274 ( .A(n1268), .Y(n1348) );
  NAND2X1 U1310 ( .A(n1256), .B(n1257), .Y(n1268) );
  INVX3 U1325 ( .A(n1480), .Y(n1916) );
  NAND2X1 U1369 ( .A(n1492), .B(n1251), .Y(n1480) );
  AOI211X1 U1371 ( .A0(n1351), .A1(ftr_row[0]), .B0(ftr_row[2]), .C0(n2129), 
        .Y(n1381) );
  OAI21XL U1372 ( .A0(n1351), .A1(ftr_row[0]), .B0(n2130), .Y(n2129) );
  XNOR2X1 U1374 ( .A(n1840), .B(ftr_row[1]), .Y(n2130) );
  NAND3BX1 U1387 ( .AN(n1839), .B(img_pos[4]), .C(img_size_r[4]), .Y(n1845) );
  NOR2X1 U1392 ( .A(n1780), .B(n2131), .Y(n793) );
  NAND2X1 U1441 ( .A(img_pos[0]), .B(img_size_r[4]), .Y(n2131) );
  OAI21XL U1492 ( .A0(n1840), .A1(n2132), .B0(n1838), .Y(n1836) );
  NAND2X1 U1503 ( .A(n1839), .B(n1758), .Y(n1838) );
  CLKINVX1 U1504 ( .A(n1831), .Y(n2132) );
  NOR2X1 U1619 ( .A(n2044), .B(n1805), .Y(n1806) );
  NAND2X1 U1696 ( .A(n1785), .B(n1804), .Y(n1805) );
  OAI21XL U1759 ( .A0(n1840), .A1(n2133), .B0(n1782), .Y(n1773) );
  NAND2X1 U1760 ( .A(n1780), .B(n1770), .Y(n1782) );
  CLKINVX1 U1761 ( .A(n1779), .Y(n2133) );
  XNOR2X1 U1762 ( .A(ftr_col[1]), .B(n1755), .Y(n1757) );
  XOR2X1 U1799 ( .A(ftr_col[2]), .B(DP_OP_284J1_122_4910_n165), .Y(n1755) );
  XNOR2X1 U1800 ( .A(ftr_cnt2[1]), .B(n1783), .Y(n1785) );
  XOR2X1 U1801 ( .A(DP_OP_307_134_2203_n209), .B(ftr_row[2]), .Y(n1783) );
  OAI22XL U1803 ( .A0(n881), .A1(n880), .B0(m_reg_r_4__4_), .B1(n1942), .Y(
        n885) );
endmodule


file handle pcdat/name='wages-military.dat' /lrecl=287.
data list file pcdat free /
  R0000100 (F5)
  W0055700 (F2)
  W0055800 (F2)
  W0055900 (F2)
  W0056000 (F2)
  W0101100 (F2)
  W0101300 (F3)
  W0141000 (F3)
  W0141200 (F3)
  W0180900 (F3)
  W0181000 (F3)
  W0181100 (F3)
  W0181200 (F3)
  W0220800 (F3)
  W0220900 (F3)
  W0221000 (F3)
  W0221100 (F3)
  W0261200 (F3)
  W0261400 (F3)
  W0301200 (F3)
  W0301400 (F3)
  W0341100 (F3)
  W0341300 (F3)
  W0381000 (F3)
  W0381200 (F3)
  W0420900 (F3)
  W0421100 (F3)
  W0461300 (F3)
  W0461500 (F3)
  W0501300 (F3)
  W0501500 (F3)
  W0541200 (F3)
  W0541400 (F3)
  W0581100 (F3)
  W0581300 (F3)
  W0621000 (F3)
  W0621200 (F3)
  W0660900 (F3)
  W0661000 (F2)
  W0661100 (F3)
  W0661200 (F2)
  W0727300 (F3)
  W0727500 (F3)
  W0798500 (F3)
  W0798600 (F3)
  W0798700 (F4)
  W0798800 (F4)
  W0869600 (F4)
  W0869800 (F4)
  W0927500 (F4)
  W0927600 (F4)
  W0993800 (F4)
  W0993900 (F4)
  W1055000 (F4)
  W1055100 (F4)
  W1055200 (F4)
  W1055300 (F4)
  W1112700 (F4)
  W1112800 (F4)
  W1169200 (F4)
  W1169300 (F4)
  W1245900 (F4)
  W1246000 (F4)
  W1321000 (F4)
  W1321100 (F4)
  W1351900 (F4)
  W1352000 (F4)
.
* The following code works with current versions of SPSS.
missing values all (-5 thru -1).
* older versions of SPSS may require this:
* recode all (-5,-3,-2,-1=-4).
* missing values all (-4).
variable labels
  R0000100  "ID# (1-12686) 79"
  W0055700  "START WK SERVICE SPELL 1, 1979 INT"
  W0055800  "START WK SERVICE SPELL 2, 1979 INT"
  W0055900  "STOP WK SERVICE SPELL 1, 1979 INT"
  W0056000  "STOP WK SERVICE SPELL 2, 1979 INT"
  W0101100  "START WK SERVICE SPELL 1, 1980 INT"
  W0101300  "STOP WK SERVICE SPELL 1, 1980 INT"
  W0141000  "START WK SERVICE SPELL 1, 1981 INT"
  W0141200  "STOP WK SERVICE SPELL 1, 1981 INT"
  W0180900  "START WK SERVICE SPELL 1, 1982 INT"
  W0181000  "START WK SERVICE SPELL 2, 1982 INT"
  W0181100  "STOP WK SERVICE SPELL 1, 1982 INT"
  W0181200  "STOP WK SERVICE SPELL 2, 1982 INT"
  W0220800  "START WK SERVICE SPELL 1, 1983 INT"
  W0220900  "START WK SERVICE SPELL 2, 1983 INT"
  W0221000  "STOP WK SERVICE SPELL 1, 1983 INT"
  W0221100  "STOP WK SERVICE SPELL 2, 1983 INT"
  W0261200  "START WK SERVICE SPELL 1, 1984 INT"
  W0261400  "STOP WK SERVICE SPELL 1, 1984 INT"
  W0301200  "START WK SERVICE SPELL 1, 1985 INT"
  W0301400  "STOP WK SERVICE SPELL 1, 1985 INT"
  W0341100  "START WK SERVICE SPELL 1, 1986 INT"
  W0341300  "STOP WK SERVICE SPELL 1, 1986 INT"
  W0381000  "START WK SERVICE SPELL 1, 1987 INT"
  W0381200  "STOP WK SERVICE SPELL 1, 1987 INT"
  W0420900  "START WK SERVICE SPELL 1, 1988 INT"
  W0421100  "STOP WK SERVICE SPELL 1, 1988 INT"
  W0461300  "START WK SERVICE SPELL 1, 1989 INT"
  W0461500  "STOP WK SERVICE SPELL 1, 1989 INT"
  W0501300  "START WK SERVICE SPELL 1, 1990 INT"
  W0501500  "STOP WK SERVICE SPELL 1, 1990 INT"
  W0541200  "START WK SERVICE SPELL 1, 1991 INT"
  W0541400  "STOP WK SERVICE SPELL 1, 1991 INT"
  W0581100  "START WK SERVICE SPELL 1, 1992 INT"
  W0581300  "STOP WK SERVICE SPELL 1, 1992 INT"
  W0621000  "START WK SERVICE SPELL 1, 1993 INT"
  W0621200  "STOP WK SERVICE SPELL 1, 1993 INT"
  W0660900  "START WK SERVICE SPELL 1, 1994 INT"
  W0661000  "START WK SERVICE SPELL 2, 1994 INT"
  W0661100  "STOP WK SERVICE SPELL 1, 1994 INT"
  W0661200  "STOP WK SERVICE SPELL 2, 1994 INT"
  W0727300  "START WK SERVICE SPELL 1, 1996 INT"
  W0727500  "STOP WK SERVICE SPELL 1, 1996 INT"
  W0798500  "START WK SERVICE SPELL 1, 1998 INT"
  W0798600  "START WK SERVICE SPELL 2, 1998 INT"
  W0798700  "STOP WK SERVICE SPELL 1, 1998 INT"
  W0798800  "STOP WK SERVICE SPELL 2, 1998 INT"
  W0869600  "START WK SERVICE SPELL 1, 2000 INT"
  W0869800  "STOP WK SERVICE SPELL 1, 2000 INT"
  W0927500  "START WK SERVICE SPELL 1, 2002 INT"
  W0927600  "STOP WK SERVICE SPELL 1, 2002 INT"
  W0993800  "START WK SERVICE SPELL 1, 2004 INT"
  W0993900  "STOP WK SERVICE SPELL 1, 2004 INT"
  W1055000  "START WK SERVICE SPELL 1, 2006 INT"
  W1055100  "START WK SERVICE SPELL 2, 2006 INT"
  W1055200  "STOP WK SERVICE SPELL 1, 2006 INT"
  W1055300  "STOP WK SERVICE SPELL 2, 2006 INT"
  W1112700  "START WK SERVICE SPELL 1, 2008 INT"
  W1112800  "STOP WK SERVICE SPELL 1, 2008 INT"
  W1169200  "START WK SERVICE SPELL 1, 2010 INT"
  W1169300  "STOP WK SERVICE SPELL 1, 2010 INT"
  W1245900  "START WK SERVICE SPELL 1, 2012 INT"
  W1246000  "STOP WK SERVICE SPELL 1, 2012 INT"
  W1321000  "START WK SERVICE SPELL 1, 2014 INT"
  W1321100  "STOP WK SERVICE SPELL 1, 2014 INT"
  W1351900  "START WK SERVICE SPELL 1, 2016 INT"
  W1352000  "STOP WK SERVICE SPELL 1, 2016 INT"
.

* Recode continuous values. 
* recode 
 W0055700 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0055800 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0055900 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0056000 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0101100 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0101300 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0141000 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0141200 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0180900 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0181000 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0181100 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0181200 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0220800 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0220900 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0221000 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0221100 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0261200 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0261400 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0301200 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0301400 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0341100 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0341300 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0381000 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0381200 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0420900 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0421100 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0461300 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0461500 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0501300 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0501500 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0541200 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0541400 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0581100 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0581300 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0621000 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0621200 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0660900 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0661000 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0661100 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0661200 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0727300 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0727500 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0798500 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0798600 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0798700 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0798800 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0869600 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0869800 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0927500 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0927600 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0993800 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W0993900 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1055000 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1055100 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1055200 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1055300 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1112700 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1112800 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1169200 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1169300 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1245900 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1246000 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1321000 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1321100 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1351900 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
    / 
 W1352000 
    (0 thru 0 eq 0)
    (1 thru 53 eq 1)
    (54 thru 105 eq 54)
    (106 thru 157 eq 106)
    (158 thru 209 eq 158)
    (210 thru 261 eq 210)
    (262 thru 313 eq 262)
    (314 thru 366 eq 314)
    (367 thru 418 eq 367)
    (419 thru 470 eq 419)
    (471 thru 522 eq 471)
    (523 thru 574 eq 523)
    (575 thru 627 eq 575)
    (628 thru 679 eq 628)
    (680 thru 731 eq 680)
    (732 thru 783 eq 732)
    (784 thru 835 eq 784)
    (836 thru 887 eq 836)
    (888 thru 940 eq 888)
    (941 thru 992 eq 941)
    (993 thru 1044 eq 993)
    (1045 thru 1096 eq 1045)
    (1097 thru 1148 eq 1097)
    (1149 thru 1201 eq 1149)
    (1202 thru 1253 eq 1202)
    (1254 thru 1305 eq 1254)
    (1306 thru 1357 eq 1306)
    (1358 thru 1409 eq 1358)
    (1410 thru 1461 eq 1410)
    (1462 thru 1514 eq 1462)
    (1515 thru 1566 eq 1515)
    (1567 thru 1618 eq 1567)
    (1619 thru 1670 eq 1619)
    (1671 thru 1722 eq 1671)
    (1723 thru 1775 eq 1723)
    (1776 thru 1827 eq 1776)
    (1828 thru 1879 eq 1828)
    (1880 thru 1931 eq 1880)
    (1932 thru 1983 eq 1932)
    (1984 thru 2035 eq 1984)
    (2036 thru 2088 eq 2036)
.

* value labels
 W0055700
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0055800
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0055900
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0056000
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0101100
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0101300
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0141000
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0141200
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0180900
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0181000
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0181100
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0181200
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0220800
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0220900
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0221000
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0221100
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0261200
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0261400
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0301200
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0301400
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0341100
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0341300
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0381000
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0381200
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0420900
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0421100
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0461300
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0461500
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0501300
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0501500
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0541200
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0541400
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0581100
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0581300
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0621000
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0621200
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0660900
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0661000
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0661100
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0661200
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0727300
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0727500
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0798500
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0798600
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0798700
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0798800
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0869600
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0869800
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0927500
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0927600
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0993800
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W0993900
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1055000
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1055100
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1055200
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1055300
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1112700
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1112800
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1169200
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1169300
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1245900
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1246000
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1321000
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1321100
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1351900
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
 W1352000
    0 "0: Week Prior to 1/1/1978"
    1 "1 TO 53: Week Number in 1978"
    54 "54 TO 105: Week Number in 1979"
    106 "106 TO 157: Week Number in 1980"
    158 "158 TO 209: Week Number in 1981"
    210 "210 TO 261: Week Number in 1982"
    262 "262 TO 313: Week Number in 1983"
    314 "314 TO 366: Week Number in 1984"
    367 "367 TO 418: Week Number in 1985"
    419 "419 TO 470: Week Number in 1986"
    471 "471 TO 522: Week Number in 1987"
    523 "523 TO 574: Week Number in 1988"
    575 "575 TO 627: Week Number in 1989"
    628 "628 TO 679: Week Number in 1990"
    680 "680 TO 731: Week Number in 1991"
    732 "732 TO 783: Week Number in 1992"
    784 "784 TO 835: Week Number in 1993"
    836 "836 TO 887: Week Number in 1994"
    888 "888 TO 940: Week Number in 1995"
    941 "941 TO 992: Week Number in 1996"
    993 "993 TO 1044: Week Number in 1997"
    1045 "1045 TO 1096: Week Number in 1998"
    1097 "1097 TO 1148: Week Number in 1999"
    1149 "1149 TO 1201: Week Number in 2000"
    1202 "1202 TO 1253: Week Number in 2001"
    1254 "1254 TO 1305: Week Number in 2002"
    1306 "1306 TO 1357: Week number in 2003"
    1358 "1358 TO 1409: Week number in 2004"
    1410 "1410 TO 1461: Week number in 2005"
    1462 "1462 TO 1514: Week number in 2006"
    1515 "1515 TO 1566: Week number in 2007"
    1567 "1567 TO 1618: Week number in 2008"
    1619 "1619 TO 1670: Week number in 2009"
    1671 "1671 TO 1722: Week number in 2010"
    1723 "1723 TO 1775: Week number in 2011"
    1776 "1776 TO 1827: Week number in 2012"
    1828 "1828 TO 1879: Week number in 2013"
    1880 "1880 TO 1931: Week number in 2014"
    1932 "1932 TO 1983: Week number in 2015"
    1984 "1984 TO 2035: Week number in 2016"
    2036 "2036 TO 2088: Week number in 2017"
    /
.
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME VARIABLES statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */  /* *start* */

* RENAME VARIABLES
  (R0000100 = CASEID_1979) 
  (W0055700 = MIL_START1_1979_XRND) 
  (W0055800 = MIL_START2_1979_XRND) 
  (W0055900 = MIL_STOP1_1979_XRND) 
  (W0056000 = MIL_STOP2_1979_XRND) 
  (W0101100 = MIL_START1_1980_XRND) 
  (W0101300 = MIL_STOP1_1980_XRND) 
  (W0141000 = MIL_START1_1981_XRND) 
  (W0141200 = MIL_STOP1_1981_XRND) 
  (W0180900 = MIL_START1_1982_XRND) 
  (W0181000 = MIL_START2_1982_XRND) 
  (W0181100 = MIL_STOP1_1982_XRND) 
  (W0181200 = MIL_STOP2_1982_XRND) 
  (W0220800 = MIL_START1_1983_XRND) 
  (W0220900 = MIL_START2_1983_XRND) 
  (W0221000 = MIL_STOP1_1983_XRND) 
  (W0221100 = MIL_STOP2_1983_XRND) 
  (W0261200 = MIL_START1_1984_XRND) 
  (W0261400 = MIL_STOP1_1984_XRND) 
  (W0301200 = MIL_START1_1985_XRND) 
  (W0301400 = MIL_STOP1_1985_XRND) 
  (W0341100 = MIL_START1_1986_XRND) 
  (W0341300 = MIL_STOP1_1986_XRND) 
  (W0381000 = MIL_START1_1987_XRND) 
  (W0381200 = MIL_STOP1_1987_XRND) 
  (W0420900 = MIL_START1_1988_XRND) 
  (W0421100 = MIL_STOP1_1988_XRND) 
  (W0461300 = MIL_START1_1989_XRND) 
  (W0461500 = MIL_STOP1_1989_XRND) 
  (W0501300 = MIL_START1_1990_XRND) 
  (W0501500 = MIL_STOP1_1990_XRND) 
  (W0541200 = MIL_START1_1991_XRND) 
  (W0541400 = MIL_STOP1_1991_XRND) 
  (W0581100 = MIL_START1_1992_XRND) 
  (W0581300 = MIL_STOP1_1992_XRND) 
  (W0621000 = MIL_START1_1993_XRND) 
  (W0621200 = MIL_STOP1_1993_XRND) 
  (W0660900 = MIL_START1_1994_XRND) 
  (W0661000 = MIL_START2_1994_XRND) 
  (W0661100 = MIL_STOP1_1994_XRND) 
  (W0661200 = MIL_STOP2_1994_XRND) 
  (W0727300 = MIL_START1_1996_XRND) 
  (W0727500 = MIL_STOP1_1996_XRND) 
  (W0798500 = MIL_START1_1998_XRND) 
  (W0798600 = MIL_START2_1998_XRND) 
  (W0798700 = MIL_STOP1_1998_XRND) 
  (W0798800 = MIL_STOP2_1998_XRND) 
  (W0869600 = MIL_START1_2000_XRND) 
  (W0869800 = MIL_STOP1_2000_XRND) 
  (W0927500 = MIL_START1_2002_XRND) 
  (W0927600 = MIL_STOP1_2002_XRND) 
  (W0993800 = MIL_START1_2004_XRND) 
  (W0993900 = MIL_STOP1_2004_XRND) 
  (W1055000 = MIL_START1_2006_XRND) 
  (W1055100 = MIL_START2_2006_XRND) 
  (W1055200 = MIL_STOP1_2006_XRND) 
  (W1055300 = MIL_STOP2_2006_XRND) 
  (W1112700 = MIL_START1_2008_XRND) 
  (W1112800 = MIL_STOP1_2008_XRND) 
  (W1169200 = MIL_START1_2010_XRND) 
  (W1169300 = MIL_STOP1_2010_XRND) 
  (W1245900 = MIL_START1_2012_XRND) 
  (W1246000 = MIL_STOP1_2012_XRND) 
  (W1321000 = MIL_START1_2014_XRND) 
  (W1321100 = MIL_STOP1_2014_XRND) 
  (W1351900 = MIL_START1_2016_XRND) 
  (W1352000 = MIL_STOP1_2016_XRND) 
.
  /* *end* */

descriptives all.

*--- Tabulations using reference number variables.
*freq var=R0000100, 
  W0055700, 
  W0055800, 
  W0055900, 
  W0056000, 
  W0101100, 
  W0101300, 
  W0141000, 
  W0141200, 
  W0180900, 
  W0181000, 
  W0181100, 
  W0181200, 
  W0220800, 
  W0220900, 
  W0221000, 
  W0221100, 
  W0261200, 
  W0261400, 
  W0301200, 
  W0301400, 
  W0341100, 
  W0341300, 
  W0381000, 
  W0381200, 
  W0420900, 
  W0421100, 
  W0461300, 
  W0461500, 
  W0501300, 
  W0501500, 
  W0541200, 
  W0541400, 
  W0581100, 
  W0581300, 
  W0621000, 
  W0621200, 
  W0660900, 
  W0661000, 
  W0661100, 
  W0661200, 
  W0727300, 
  W0727500, 
  W0798500, 
  W0798600, 
  W0798700, 
  W0798800, 
  W0869600, 
  W0869800, 
  W0927500, 
  W0927600, 
  W0993800, 
  W0993900, 
  W1055000, 
  W1055100, 
  W1055200, 
  W1055300, 
  W1112700, 
  W1112800, 
  W1169200, 
  W1169300, 
  W1245900, 
  W1246000, 
  W1321000, 
  W1321100, 
  W1351900, 
  W1352000.

*--- Tabulations using qname variables.
*freq var=CASEID_1979, 
  MIL_START1_1979_XRND, 
  MIL_START2_1979_XRND, 
  MIL_STOP1_1979_XRND, 
  MIL_STOP2_1979_XRND, 
  MIL_START1_1980_XRND, 
  MIL_STOP1_1980_XRND, 
  MIL_START1_1981_XRND, 
  MIL_STOP1_1981_XRND, 
  MIL_START1_1982_XRND, 
  MIL_START2_1982_XRND, 
  MIL_STOP1_1982_XRND, 
  MIL_STOP2_1982_XRND, 
  MIL_START1_1983_XRND, 
  MIL_START2_1983_XRND, 
  MIL_STOP1_1983_XRND, 
  MIL_STOP2_1983_XRND, 
  MIL_START1_1984_XRND, 
  MIL_STOP1_1984_XRND, 
  MIL_START1_1985_XRND, 
  MIL_STOP1_1985_XRND, 
  MIL_START1_1986_XRND, 
  MIL_STOP1_1986_XRND, 
  MIL_START1_1987_XRND, 
  MIL_STOP1_1987_XRND, 
  MIL_START1_1988_XRND, 
  MIL_STOP1_1988_XRND, 
  MIL_START1_1989_XRND, 
  MIL_STOP1_1989_XRND, 
  MIL_START1_1990_XRND, 
  MIL_STOP1_1990_XRND, 
  MIL_START1_1991_XRND, 
  MIL_STOP1_1991_XRND, 
  MIL_START1_1992_XRND, 
  MIL_STOP1_1992_XRND, 
  MIL_START1_1993_XRND, 
  MIL_STOP1_1993_XRND, 
  MIL_START1_1994_XRND, 
  MIL_START2_1994_XRND, 
  MIL_STOP1_1994_XRND, 
  MIL_STOP2_1994_XRND, 
  MIL_START1_1996_XRND, 
  MIL_STOP1_1996_XRND, 
  MIL_START1_1998_XRND, 
  MIL_START2_1998_XRND, 
  MIL_STOP1_1998_XRND, 
  MIL_STOP2_1998_XRND, 
  MIL_START1_2000_XRND, 
  MIL_STOP1_2000_XRND, 
  MIL_START1_2002_XRND, 
  MIL_STOP1_2002_XRND, 
  MIL_START1_2004_XRND, 
  MIL_STOP1_2004_XRND, 
  MIL_START1_2006_XRND, 
  MIL_START2_2006_XRND, 
  MIL_STOP1_2006_XRND, 
  MIL_STOP2_2006_XRND, 
  MIL_START1_2008_XRND, 
  MIL_STOP1_2008_XRND, 
  MIL_START1_2010_XRND, 
  MIL_STOP1_2010_XRND, 
  MIL_START1_2012_XRND, 
  MIL_STOP1_2012_XRND, 
  MIL_START1_2014_XRND, 
  MIL_STOP1_2014_XRND, 
  MIL_START1_2016_XRND, 
  MIL_STOP1_2016_XRND.

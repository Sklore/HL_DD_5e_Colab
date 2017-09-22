<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
	<xsl:output encoding="utf-8" method="html" />
	<xsl:template match="/">

    <!-- Add a proper DOCTYPE declaration here, to make sure the page is rendered properly. Firefox doesn't need this, so we make sure it doesn't get output when we're using "Transformiix", the Firefox XSLT processor.
    NOTE: This weird behaviour is only an issue if you have this stylesheet directly linked from an XML document, i.e. if you're trying to test it without having to tell HL to regenerate the XML file every time. -->
	<xsl:if test="system-property('xsl:vendor') != 'Transformiix'">
		<xsl:text disable-output-escaping="yes">
			&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"&gt;
		</xsl:text>
	</xsl:if>
	<html>
		<head>
			<!-- XHTML requires that you specify a meta-tag to dictate the content type. -->
			<xsl:text disable-output-escaping="yes">
				&lt;meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/&gt;
			</xsl:text>
			<style type="text/css">
				@import url('https://fonts.googleapis.com/css?family=Quando');
				body {
					font-family: "Quando", serif;
					width: 700px;
					font-size: 10pt;
				}
				pre {
					font-family: "Quando", serif;
					white-space: pre-wrap;
					font-size: 10pt;
					margin-top: 0px;
					margin-bottom: 0px;
				}
				header {
					text-align: right;
				}
				#full-width {
					width: 100%;
					float: left;
				}
				#left {
					width: 67%;
					float: left;
				}
				#right {
					width: 33%;
					float: left;
				}
				#left-50 {
					width: 50%;
					float: left;
				}
				#right-50 {
					width: 50%;
					float: left;
				}
				.shield {
					background-image: url("data:image/png;base64,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CRaIiIhgIgsODkbBIkg1WLNmDaMfmMyFSV2TCDYxMZHa2NjoRWhtbU1jYmJQtP/X3plAWzX9cXy3MraE0KBUSIYyNBmSUKHQiqyUCtGAlDIkkZkyFZXmwRQyhMqSVsYmRWYhY8oQEbJSoZz/+Wzv9/7n3XvOuefee8499767v2vtznu9++479+zfd/9+e+/v77cNDFLgsMMOSyKsPXdNybuMCbtt2zarVatWSX+0c+fOhrAGBj4YPXp0Em8qVKhgLVy4MDrCgkcffTTpD++8887Wu+++a0hrYOCCH374wdpnn32SeHP66acH4lxWhGXx6cADD0z64927dzeENTBwQb9+/ZL4wtQyiHfNmrCgZGU4afL8xhtvGNIaGDgAKRNVgrRu3boF5lvWhF2/fr1Vt27dpJs46aSTDGENDBxo0qRJEk92331369NPP80dYcGoUaOSboT20EMPGdIaGNgYNGiQK0eGDRuWFtdCISxz2YYNGybdDJPr7777zpDWoKgxe/ZsveWpEvjRrFkz688//8w9YcHMmTNdR5BzzjnHENagaPHll19aNWvWTOLFTjvtZC1evDhtnoVGWMDGr3Ih7aRJkwxpDYoSxx57rCsnbrvttow4Fiphv/jiC6tq1apJN1e5cmWzamxQdCjZ3kxq7dq1s/7+++/4CQumTZvmepP777+/tWbNGkNag6LAgAEDXHmw3377aR5kitAJC3r06OF6s82bNzeENSj3uOGGG1ztn8osixYtyopbkRCWvVm3PSdVIsGK+4EaGESFm2++2dXuK1asaE2fPj1rbkVCWLBixQqrevXqrjd/7rnnGtIalDtce+21rvZOu+eee0LhVWSEBVSmSCyQLK13796GtAblBpdccoknWQcPHhwapyIlLHjssceS8mallXxIA4OCxllnneVJ1ssuuyxUPkVOWHD//fd7fqBevXoZ0hoUJDiipmQh1bX1798/dC7lhLDgrrvu8vxgJh3PoNAwf/58q06dOp42ffXVV0fCo5wRFnitoNHat29vSGtQEKDaIYUalIct33HHHZFxKKeEBUiyvD4oMq6vv/7aENcgL7F27VrRxrs2SDx16tRI+ZNzwgK/8PiAAw7Qoui4O8fAwAmO1DjkkEM87ZbwmDA5asRCWMBCFIWn3D48Sb2PPPKIIa1BXoCSvm7pcdJatmxpffbZZznhTWyE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3tT1y4bhxtu1a6cXZVBUIYUsZnCOaKo5LuL2O++8M1bSEqYRqgchKosn48ePLzrpILZM+IptY+NeJKXBEbgCZwRwSX5et25dzTU/VOCfIJ1nx+DKDoeUzX79/bhx49Sll15a+vMff/yRjAs1efJkchl936tWrVrqoIMOUo0aNVJHHHGEFnTbN6v23HNPVbFixcgMcOvWrfr+baNStgcovdphm04AsOdZavfdd1eXX365skOYyO4DbNu2TT3wwANq+PDhnJbm+To7ulH33HMPzylnCQZofe+99141bdq00v72gk1UbQf2PEztsssuod+L7bUU90JfVa1aVSep2KTQ/bTbbrvptuuuu6odd9xRbbfddpE9E/pr/fr1avXq1WrlypU6WeGDDz7Qtm6T1vd37emBsuevqnv37qpGjRql/z9hwoRSDnH/JKS0adPG970CExZA0v79++uveTiTJk1SPXv2LPMaDP/ZZ59Vjz76KMchKHvCnfJ97Um27oy9995b1a5dWxOa76tUqaI7o3LlyqpSpUpqp512UvZor0kNoSDg33//rY2K65YtW5QdZujO3bBhg/rtt9/0Q+bK9/xs48aNpb+zadOmJIM86qij8CyRdXwiGOhuueUWNWXKFG0UbsAohw0bxrOPnLR4dXsenTKDCaL269dPE5XspSjRvHlztWzZsjL/h4FjE1x32GEHPVhgJzwr7IbBn6sQmp9hP7xWfgcbZkDguUMD7AebwE5oMojbHlF9++23au3atfr7oDZtz13Vueeeq+xpkB5onLCniuriiy8ufa+xY8fq55kS6YYAJYcsl65mUZLFDUipOBbhmmuu0YfiBtmjS9WYuEsLEqahXWVriuJbrGqyCsccgRIyHClI2Jn4O2he4wA1h1IlHCBKIGSKghQsJAYpZieh759//pmzZ0Opl8T7oO/oQ/qSPqW6CH1MX9PnQXTL2JDTprK1T2wcW8fmsX2v83ioZuJcgIRTQZGWhy0huPaq5DACPB4hC2GkFzZv3qxz+QirFyxYoFasWKE9S7bYeeedVbVq1bRHtufYyp7Mq4MPPlhfq1evrr0w4S5/j7xXroyUeF1GUzx04se35yLqhhtuCJUMQcG94m0Zbb3A1GHkyJGqU6dOoXhbaljxmSdOnOj7Op4pHqBXr17aa+USRGzkvzqB3eEh8Zp403322Ud7/aOP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");
					background-position: center;
					vertical-align: center;
					background-repeat: no-repeat;
					text-align: center;
				}
				.hitpoint_scroll {
					background-image: url("data:image/svg+xml;charset=utf8,%3C?xml version='1.0' standalone='no'?%3E%3C!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 20010904//EN' 'http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd'%3E%3Csvg version='1.0' xmlns='http://www.w3.org/2000/svg' width='227' height='185' viewBox='0 0 294.000000 240.000000' preserveAspectRatio='xMidYMid meet'%3E%3Cg transform='translate(0.000000,240.000000) scale(0.100000,-0.100000)' fill='%23000000' stroke='none'%3E%3Cpath d='M2726 2390 c-72 -22 -107 -84 -114 -202 l-5 -88 -1253 -2 c-1247 -3 -1253 -3 -1281 -24 -15 -11 -38 -40 -50 -64 l-23 -44 0 -916 0 -916 23 -44 c30 -59 65 -82 129 -87 42 -3 61 1 92 19 60 35 79 76 84 180 l4 88 1242 2 c1234 3 1241 3 1281 24 25 13 47 36 62 64 l23 43 0 926 0 926 -23 40 c-14 26 -37 48 -67 63 -46 23 -76 26 -124 12z m110 -40 c90 -44 99 -173 15 -223 -54 -31 -61 -25 -61 53 0 73 -13 91 -31 43 -12 -33 -26 -43 -59 -43 -36 0 -50 18 -50 63 0 47 31 94 74 113 43 18 63 17 112 -6z m-115 -197 c38 5 39 4 39 -24 l0 -30 -57 3 c-58 3 -58 3 -61 36 -3 32 -2 33 19 22 12 -7 39 -10 60 -7z m178 -1746 c-6 -15 -25 -39 -41 -52 l-30 -25 -1249 0 -1249 0 0 804 c0 562 -3 813 -11 835 -22 63 -107 77 -149 24 -16 -21 -20 -41 -20 -104 0 -88 -4 -92 -58 -59 -34 21 -62 71 -62 111 0 36 31 88 65 109 32 20 47 20 1371 20 1287 0 1341 1 1380 19 23 10 45 25 50 32 14 22 17 -1680 3 -1714z m-2623 1568 c21 -21 24 -31 18 -58 -9 -43 -32 -75 -65 -93 -46 -23 -49 -19 -49 59 0 73 10 99 40 110 26 9 30 8 56 -18z m-179 -184 c48 -25 137 -9 181 31 l22 21 0 -848 c0 -834 0 -849 -20 -891 -47 -95 -181 -97 -232 -3 -17 32 -18 80 -18 888 l0 854 23 -20 c12 -11 32 -26 44 -32z'/%3E%3Cpath d='M1965 911 c-11 -5 -29 -19 -40 -31 -18 -20 -20 -39 -23 -209 -2 -117 1 -200 8 -223 20 -68 19 -68 469 -68 430 0 441 1 467 51 18 36 20 394 3 433 -25 54 -42 56 -471 55 -216 0 -402 -4 -413 -8z m846 -50 c17 -21 19 -41 19 -214 0 -182 -1 -192 -22 -214 l-21 -23 -408 0 -408 0 -20 26 c-20 25 -21 40 -21 211 0 192 5 217 43 233 12 5 201 8 420 7 l399 -2 19 -24z'/%3E%3C/g%3E%3C/svg%3E");
					background-repeat: no-repeat;
					height: 185px;
					padding: 0px 0px 0px 25px;
				}
				.scroll {
					background-image: url("data:image/svg+xml;charset=utf8,%3C?xml version='1.0' standalone='no'?%3E%3C!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 20010904//EN' 'http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd'%3E%3Csvg version='1.0' xmlns='http://www.w3.org/2000/svg' width='227' height='185' viewBox='0 0 294.000000 240.000000' preserveAspectRatio='xMidYMid meet'%3E%3Cg transform='translate(0.000000,240.000000) scale(0.100000,-0.100000)' fill='%23000000' stroke='none'%3E%3Cpath d='M2726 2390 c-72 -22 -107 -84 -114 -202 l-5 -88 -1253 -2 c-1247 -3 -1253 -3 -1281 -24 -15 -11 -38 -40 -50 -64 l-23 -44 0 -916 0 -916 23 -44 c30 -59 65 -82 129 -87 42 -3 61 1 92 19 60 35 79 76 84 180 l4 88 1242 2 c1234 3 1241 3 1281 24 25 13 47 36 62 64 l23 43 0 926 0 926 -23 40 c-14 26 -37 48 -67 63 -46 23 -76 26 -124 12z m110 -40 c90 -44 99 -173 15 -223 -54 -31 -61 -25 -61 53 0 73 -13 91 -31 43 -12 -33 -26 -43 -59 -43 -36 0 -50 18 -50 63 0 47 31 94 74 113 43 18 63 17 112 -6z m-115 -197 c38 5 39 4 39 -24 l0 -30 -57 3 c-58 3 -58 3 -61 36 -3 32 -2 33 19 22 12 -7 39 -10 60 -7z m178 -1746 c-6 -15 -25 -39 -41 -52 l-30 -25 -1249 0 -1249 0 0 804 c0 562 -3 813 -11 835 -22 63 -107 77 -149 24 -16 -21 -20 -41 -20 -104 0 -88 -4 -92 -58 -59 -34 21 -62 71 -62 111 0 36 31 88 65 109 32 20 47 20 1371 20 1287 0 1341 1 1380 19 23 10 45 25 50 32 14 22 17 -1680 3 -1714z m-2623 1568 c21 -21 24 -31 18 -58 -9 -43 -32 -75 -65 -93 -46 -23 -49 -19 -49 59 0 73 10 99 40 110 26 9 30 8 56 -18z m-179 -184 c48 -25 137 -9 181 31 l22 21 0 -848 c0 -834 0 -849 -20 -891 -47 -95 -181 -97 -232 -3 -17 32 -18 80 -18 888 l0 854 23 -20 c12 -11 32 -26 44 -32z'/%3E%3C/g%3E%3C/svg%3E");
					height: 185px;
					padding: 0px 25px;
				}
				.borderbottom {
					border-bottom: 1px solid #b0b0b0;
				}
				.borderbottomblack {
					border-bottom: 1px solid #000;
					text-align: center;
					font-weight: bold;
				}
				.spellslot {
					border-bottom: 1px solid #000;
					text-align: left;
					font-weight: bold;
				}				
				.subtitle {
					font-size: 6pt;
					font-weight: bold;
					font-style: italic;
					vertical-align: top;
				}
				h1 {
					text-align: center; /* Center the title in the middle of the page in big text */
					font-size: 12pt;
					margin: 0px 0px; /* Margin not needed to look good */
				}
				td {
					margin: 0px 5px;					
				}
				td.proficiency_bonus {
					background-image: url("data:image/svg+xml;charset=utf8,%3C?xml version='1.0' standalone='no'?%3E%3C!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 20010904//EN' 'http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd'%3E%3Csvg version='1.0' xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 75.000000 62.000000' preserveAspectRatio='xMidYMid meet'%3E%3Cg transform='translate(0.000000,62.000000) scale(0.100000,-0.100000)' fill='%23000000' stroke='none'%3E%3Cpath d='M5 611 c-4 -8 75 -342 136 -573 l10 -38 224 0 224 0 10 38 c61 231 140 565 136 573 -8 12 -732 12 -740 0z m643 -301 l-70 -280 -202 0 -201 0 -68 272 c-37 150 -67 276 -67 281 0 4 152 7 339 7 l339 0 -70 -280z'/%3E%3C/g%3E%3C/svg%3E");
					background-position: center;
					vertical-align: center;
					background-repeat: no-repeat;
					text-align: center;
					font-size: 12pt;
				}
				td.speed {
					background-image: url("data:image/svg+xml;charset=utf8,%3C?xml version='1.0' standalone='no'?%3E%3C!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 20010904//EN' 'http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd'%3E%3Csvg version='1.0' xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 63.000000 63.000000' preserveAspectRatio='xMidYMid meet'%3E%3Cg transform='translate(0.000000,63.000000) scale(0.100000,-0.100000)' fill='%23000000' stroke='none'%3E%3Cpath d='M104 613 c-17 -54 -33 -70 -86 -87 -16 -5 -18 -24 -18 -216 0 -206 0 -210 21 -210 27 0 79 -52 79 -79 0 -21 4 -21 215 -21 211 0 215 0 215 21 0 27 52 79 79 79 21 0 21 3 19 212 -3 204 -4 213 -23 216 -28 6 -56 32 -72 70 l-13 32 -205 0 c-187 0 -206 -2 -211 -17z m410 -47 c10 -19 33 -42 52 -52 l34 -19 0 -183 c0 -165 -2 -183 -17 -189 -27 -9 -64 -45 -74 -70 -8 -23 -11 -23 -191 -23 l-183 0 -19 34 c-10 19 -34 42 -52 51 l-34 16 0 182 0 182 33 16 c17 8 41 32 52 52 l20 37 180 0 180 0 19 -34z'/%3E%3C/g%3E%3C/svg%3E");
					background-position: center;
					vertical-align: center;
					background-repeat: no-repeat;
					text-align: center;
					font-size: 12pt;
				}
				td.ac {
					background-image: url("data:image/svg+xml;charset=utf8,%3C?xml version='1.0' standalone='no'?%3E%3C!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 20010904//EN' 'http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd'%3E%3Csvg version='1.0' xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 74.000000 86.000000' preserveAspectRatio='xMidYMid meet'%3E%3Cg transform='translate(0.000000,86.000000) scale(0.100000,-0.100000)' fill='%23000000' stroke='none'%3E%3Cpath d='M213 831 c-39 -10 -98 -31 -130 -47 -56 -28 -58 -30 -66 -79 -12 -76 0 -254 23 -327 24 -78 65 -144 138 -221 62 -65 171 -147 195 -147 25 0 129 82 195 156 119 131 162 257 162 478 0 107 -2 110 -90 149 -128 57 -292 71 -427 38z m305 -32 c26 -7 76 -25 111 -40 l63 -29 -4 -147 c-6 -165 -17 -212 -75 -302 -60 -94 -204 -231 -243 -231 -20 0 -114 76 -175 141 -112 120 -145 216 -145 422 l0 118 67 31 c122 55 270 69 401 37z'/%3E%3C/g%3E%3C/svg%3E");
					background-position: center;
					vertical-align: center;
					background-repeat: no-repeat;
					text-align: center;
					font-size: 12pt;
				}
				td.initiative {
					background-image: url("data:image/svg+xml;charset=utf8,%3C?xml version='1.0' standalone='no'?%3E%3C!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 20010904//EN' 'http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd'%3E%3Csvg version='1.0' xmlns='http://www.w3.org/2000/svg' width='60' height='60' viewBox='0 0 74.000000 74.000000' preserveAspectRatio='xMidYMid meet'%3E%3Cg transform='translate(0.000000,74.000000) scale(0.100000,-0.100000)' fill='%23000000' stroke='none'%3E%3Cpath d='M283 725 c-77 -21 -122 -47 -174 -102 -125 -129 -141 -309 -42 -460 133 -202 436 -217 588 -28 41 51 55 77 71 140 28 103 10 208 -52 300 -54 81 -132 133 -232 154 -67 14 -94 13 -159 -4z m229 -52 c59 -26 133 -95 161 -149 25 -49 40 -134 34 -190 -26 -250 -311 -385 -520 -247 -101 67 -150 159 -151 283 -1 247 247 405 476 303z'/%3E%3C/g%3E%3C/svg%3E");
					background-position: center;
					vertical-align: center;
					background-repeat: no-repeat;
					text-align: center;
					font-size: 12pt;
				}
				td.square {
					background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='30' height='30' viewBox='0 0 24 24'%3E%3Cpath d='M22 2v20h-20v-20h20zm2-2h-24v24h24v-24z'/%3E%3C/svg%3E");
					background-position: center;
					vertical-align: center;
					background-repeat: no-repeat;
					text-align: center;
					font-size: 12pt;
				}
				p.herodetails {
					font-size: 8pt; /* Hero details (gender, class, etc) can be pretty small */
				}
				ul.abilityscores {
					font-size: 15pt; /* Text in the attributes list should be pretty large */
					list-style-type: none; /* Hiding the list bullets looks better */
					padding-left: 0px; /* We're the leftmost list in the table, so remove our left padding, otherwise the centering looks wrong */
					margin-top: 0px; /* Our original margin is overkill, so shrink it */
					margin-bottom: 10px;
				}
				ul.skills {
					font-size: 10pt; /* Text in the skills list should be smaller */
					list-style-type: none; /* Hiding the list bullets looks better */
				}
				ul.secondary {
					font-size: 9pt; /* Traits in secondary lists can be smaller still */
					list-style-type: none; /* Hiding the list bullets looks better */
					padding: 5px 15px; /* Change our padding and margins to spread us out nicely */
				    margin: 5px;
				}
				p.gear, p.abilities, p.spells {
					font-size: 10.5pt; /* Same with gear and abilities, but the text needs decent margins set to look good */
					margin-left: 15pt;
					margin-bottom: 5pt;
				}
				p.legal {
					text-align: center; /* Legal text */
					font-size: 6pt;
				}
				img.portrait {
					width: 236px;
					max-height: 250px;
					overflow: hidden;
				}
			</style>

			<!-- Page title - just find the first character and use its name  -->
			<title><xsl:value-of select="/document/public/character/@name"/></title>
		</head>

		<body>

			<!-- Output all our character nodes in turn
			NOTE: We use //character to ensure that we pick up minions as well, since they're children of characters -->
			<xsl:apply-templates select="/document/public//character"/>
		</body>
	</html>
	</xsl:template>

	<!-- Quick template to insert a space somewhere, even if XSL would normally collapse it -->
	<xsl:template name="space">
		<xsl:text> </xsl:text>
	</xsl:template>

	<!-- How to output each character in the document -->
	<xsl:template match="character">

			<!-- D&D Logo -->
			<header>
				<img src="data:image/png;base64,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" />
			</header>

			<!-- Output various important traits in a 4-wide table - start with hero details and ability scores -->
			<section>
				<table width="100%">
					<tr>
						<td width="33%" colspan="2" class="borderbottom" height="12px"><xsl:value-of select="@name"/></td>
						<td width="33%" class="borderbottom"><xsl:value-of select="@playername"/></td>
						<td width="33%" rowspan="8"><img src="data:image/png;base64,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CRaIiIhgIgsODkbBIkg1WLNmDaMfmMyFSV2TCDYxMZHa2NjoRWhtbU1jYmJQtP/X3plAWzX9cXy3MraE0KBUSIYyNBmSUKHQiqyUCtGAlDIkkZkyFZXmwRQyhMqSVsYmRWYhY8oQEbJSoZz/+Wzv9/7n3XvOuefee8499767v2vtznu9++479+zfd/9+e+/v77cNDFLgsMMOSyKsPXdNybuMCbtt2zarVatWSX+0c+fOhrAGBj4YPXp0Em8qVKhgLVy4MDrCgkcffTTpD++8887Wu+++a0hrYOCCH374wdpnn32SeHP66acH4lxWhGXx6cADD0z64927dzeENTBwQb9+/ZL4wtQyiHfNmrCgZGU4afL8xhtvGNIaGDgAKRNVgrRu3boF5lvWhF2/fr1Vt27dpJs46aSTDGENDBxo0qRJEk92331369NPP80dYcGoUaOSboT20EMPGdIaGNgYNGiQK0eGDRuWFtdCISxz2YYNGybdDJPr7777zpDWoKgxe/ZsveWpEvjRrFkz688//8w9YcHMmTNdR5BzzjnHENagaPHll19aNWvWTOLFTjvtZC1evDhtnoVGWMDGr3Ih7aRJkwxpDYoSxx57rCsnbrvttow4Fiphv/jiC6tq1apJN1e5cmWzamxQdCjZ3kxq7dq1s/7+++/4CQumTZvmepP777+/tWbNGkNag6LAgAEDXHmw3377aR5kitAJC3r06OF6s82bNzeENSj3uOGGG1ztn8osixYtyopbkRCWvVm3PSdVIsGK+4EaGESFm2++2dXuK1asaE2fPj1rbkVCWLBixQqrevXqrjd/7rnnGtIalDtce+21rvZOu+eee0LhVWSEBVSmSCyQLK13796GtAblBpdccoknWQcPHhwapyIlLHjssceS8mallXxIA4OCxllnneVJ1ssuuyxUPkVOWHD//fd7fqBevXoZ0hoUJDiipmQh1bX1798/dC7lhLDgrrvu8vxgJh3PoNAwf/58q06dOp42ffXVV0fCo5wRFnitoNHat29vSGtQEKDaIYUalIct33HHHZFxKKeEBUiyvD4oMq6vv/7aENcgL7F27VrRxrs2SDx16tRI+ZNzwgK/8PiAAw7Qoui4O8fAwAmO1DjkkEM87ZbwmDA5asRCWMBCFIWn3D48Sb2PPPKIIa1BXoCSvm7pcdJatmxpffbZZznhTWyE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3tT1y4bhxtu1a6cXZVBUIYUsZnCOaKo5LuL2O++8M1bSEqYRqgchKosn48ePLzrpILZM+IptY+NeJKXBEbgCZwRwSX5et25dzTU/VOCfIJ1nx+DKDoeUzX79/bhx49Sll15a+vMff/yRjAs1efJkchl936tWrVrqoIMOUo0aNVJHHHGEFnTbN6v23HNPVbFixcgMcOvWrfr+baNStgcovdphm04AsOdZavfdd1eXX365skOYyO4DbNu2TT3wwANq+PDhnJbm+To7ulH33HMPzylnCQZofe+99141bdq00v72gk1UbQf2PEztsssuod+L7bUU90JfVa1aVSep2KTQ/bTbbrvptuuuu6odd9xRbbfddpE9E/pr/fr1avXq1WrlypU6WeGDDz7Qtm6T1vd37emBsuevqnv37qpGjRql/z9hwoRSDnH/JKS0adPG970CExZA0v79++uveTiTJk1SPXv2LPMaDP/ZZ59Vjz76KMchKHvCnfJ97Um27oy9995b1a5dWxOa76tUqaI7o3LlyqpSpUpqp512UvZor0kNoSDg33//rY2K65YtW5QdZujO3bBhg/rtt9/0Q+bK9/xs48aNpb+zadOmJIM86qij8CyRdXwiGOhuueUWNWXKFG0UbsAohw0bxrOPnLR4dXsenTKDCaL269dPE5XspSjRvHlztWzZsjL/h4FjE1x32GEHPVhgJzwr7IbBn6sQmp9hP7xWfgcbZkDguUMD7AebwE5oMojbHlF9++23au3atfr7oDZtz13Vueeeq+xpkB5onLCniuriiy8ufa+xY8fq55kS6YYAJYcsl65mUZLFDUipOBbhmmuu0YfiBtmjS9WYuEsLEqahXWVriuJbrGqyCsccgRIyHClI2Jn4O2he4wA1h1IlHCBKIGSKghQsJAYpZieh759//pmzZ0Opl8T7oO/oQ/qSPqW6CH1MX9PnQXTL2JDTprK1T2wcW8fmsX2v83ioZuJcgIRTQZGWhy0huPaq5DACPB4hC2GkFzZv3qxz+QirFyxYoFasWKE9S7bYeeedVbVq1bRHtufYyp7Mq4MPPlhfq1evrr0w4S5/j7xXroyUeF1GUzx04se35yLqhhtuCJUMQcG94m0Zbb3A1GHkyJGqU6dOoXhbaljxmSdOnOj7Op4pHqBXr17aa+USRGzkvzqB3eEh8Zp403322Ud7/aOP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" style="position: absolute; top: 55px; left: 480px; z-index: 100;" /><xsl:apply-templates select="images/image[position() = 1]"/></td>
					</tr>
					<tr>
						<td colspan="2" class="subtitle" height="12px">Character's Name</td>
						<td class="subtitle">Player's Name</td>
					</tr>
					<tr>
						<td colspan="2" class="borderbottom" height="12px"><xsl:value-of select="subrace/@name"/>, <xsl:if test="classes/@summary != ''"><xsl:value-of select="classes/@summary"/></xsl:if></td>
						<td class="borderbottom"><xsl:value-of select="background/@name"/></td>
					</tr>
					<tr>
						<td colspan="2" class="subtitle" height="12px">Race, Class &amp; Level</td>
						<td class="subtitle">Background</td>
					</tr>
					<tr>
						<td colspan="2" class="borderbottom" height="12px"><xsl:value-of select="alignment/@name"/></td>
						<td rowspan="4" class="hitpoint_scroll">
						<table width="100%">
							<tr>
								<td colspan="2" style="text-align: center;"><strong>Hit Points</strong></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;"><xsl:value-of select="health/@hitpoints"/><br /><br /></td>
							</tr>
							<tr>
								<td><strong>Death Saves</strong></td>
								<td style="text-align: center;"><strong>Hit Dice</strong></td>
							</tr>
							<tr>
								<td><strong>Success</strong> <span style="float: right;">ooo</span><br />
								<strong>Failure</strong> <span style="float: right;">ooo</span></td>
								<td style="text-align: center;"><br /><xsl:value-of select="health/hitdice/@text"/></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="subtitle" height="12px">Alignment</td>
					</tr>
					<tr>
						<td class="proficiency_bonus" style="height: 65px;"><xsl:value-of select="proficiencybonus/@total"/></td>
						<td class="speed"><xsl:value-of select="movement/speed/@value"/> ft.</td>
					</tr>
					<tr>
						<td class="subtitle" style="text-align: center;">Proficiency<br />Bonus</td>
						<td class="subtitle" style="text-align: center;">Speed</td>
					</tr>
				</table>
			</section>
			<section id="left">
				<table width="100%">
					<tr>
						<td width="30px"></td>
						<td></td>
						<td width="30px" class="subtitle" style="text-align: center; vertical-align: bottom; font-size: 6px;">Modifier</td>
						<td width="30px" class="subtitle" style="text-align: center; vertical-align: bottom; font-size: 6px;">Saving<br />Throws</td>
						<td width="30px"></td>
						<td></td>
					</tr>
					<tr>
						<xsl:apply-templates select="abilityscores/abilityscore[position() &lt;= 1]"/>
						<td rowspan="2" class="ac"><xsl:value-of select="armorclass/@ac"/></td>
					</tr>
					<tr>
						<xsl:apply-templates select="abilityscores/abilityscore[position() &gt;= 4 and (position() &lt; 5)]"/>
					</tr>
					<tr>
						<xsl:apply-templates select="abilityscores/abilityscore[position() &gt;= 5 and (position() &lt; 6)]"/>
						<td class="subtitle" style="text-align: center;">AC</td>
					</tr>
					<tr>
						<xsl:apply-templates select="abilityscores/abilityscore[position() &gt;= 2 and (position() &lt; 3)]"/>
						<td rowspan="2" class="initiative"><xsl:value-of select="initiative/@total"/></td>
					</tr>
					<tr>
						<xsl:apply-templates select="abilityscores/abilityscore[position() &gt;= 3 and (position() &lt; 4)]"/>
					</tr>
					<tr>
						<xsl:apply-templates select="abilityscores/abilityscore[position() &gt;= 6 and (position() &lt; 7)]"/>
						<td class="subtitle" style="text-align: center;">Initiative</td>
					</tr>
				</table>
				<table width="100%">
					<tr>
						<td width="50%" style="padding-top: 28px;" class="borderbottomblack">Weapon</td>
						<td width="20%" style="padding-top: 28px;" class="borderbottomblack">Attack</td>
						<td width="30%" style="padding-top: 28px;" class="borderbottomblack">Damage</td>
					</tr>
					<tr>
						<xsl:apply-templates select="melee/weapon | ranged/weapon"/>
					</tr>
					<xsl:if test="count(spellbook/spell) != 0">
					<tr>
						<td class="borderbottom">Spells</td>
						<td class="borderbottom"><xsl:value-of select="classes/class/@spellattack"/></td>
						<td class="borderbottom">Spell Save DC <xsl:value-of select="classes/class/@spellsavedc"/></td>
					</tr>
					</xsl:if>
					<xsl:if test="count(spellsknown/spell) != 0">
					<tr>
						<td class="borderbottom">Spells</td>
						<td class="borderbottom"><xsl:value-of select="classes/class/@spellattack"/></td>
						<td class="borderbottom">Spell Save DC <xsl:value-of select="classes/class/@spellsavedc"/></td>
					</tr>
					</xsl:if>
					<tr>
						<td colspan="3" style="padding-top: 28px;" class="borderbottomblack">Features &amp; Traits</td>
					</tr>
					<xsl:if test="racespells/spellability != 0">
					<tr>
						<td colspan="3" class="borderbottom"><xsl:value-of select="racespells/spellability/@name"/></td>
					</tr>
					</xsl:if>
					<xsl:if test="damageresistances/@text != ''">
					<tr>
						<td colspan="3" class="borderbottom">Damage Resistance:<xsl:call-template name="space"/><xsl:value-of select="damageresistances/@text"/></td>
					</tr>
					</xsl:if>
					<xsl:if test="damageimmunities/@text != ''">
					<tr>
						<td colspan="3" class="borderbottom">Damage Immunities:<xsl:call-template name="space"/><xsl:value-of select="damageimmunities/@text"/></td>
					</tr>
					</xsl:if>
					<xsl:if test="damagevulnerabilities/@text != ''">
					<tr>
						<td colspan="3" class="borderbottom">Damage Vulnerabilities:<xsl:call-template name="space"/><xsl:value-of select="damagevulnerabilities/@text"/></td>
					</tr>
					</xsl:if>
					<xsl:apply-templates select="feats/feat | traits/trait | */special"/>
				</table>
			</section>
			<section id="right">
				<table width="100%">
					<tr>
						<td colspan="4" style="padding-top: 28px; text-align: center;"><strong>Skills</strong></td>
					</tr>
					<xsl:apply-templates select="skills/skill"/>
				</table>
			</section>
			<div style="page-break-before: always;"></div>
			<section>
				<table width="100%">
					<tr>
						<td class="borderbottom" height="12px"><xsl:value-of select="personal/@age"/></td>
						<td class="borderbottom" height="12px"><xsl:value-of select="personal/@eyes"/></td>
						<td class="borderbottom" height="12px"><xsl:value-of select="personal/charweight/@text"/></td>
						<td class="borderbottom" height="12px"><xsl:value-of select="personal/charheight/@text"/></td>
						<td class="borderbottom" height="12px"><xsl:value-of select="personal/@skin"/></td>
						<td class="borderbottom" height="12px"><xsl:value-of select="personal/@hair"/></td>
					</tr>
					<tr>
						<td class="subtitle">Age</td>
						<td class="subtitle">Eyes</td>
						<td class="subtitle">Weight</td>
						<td class="subtitle">Height</td>
						<td class="subtitle">Skin</td>
						<td class="subtitle">Hair</td>
					</tr>
					<tr>
						<td class="borderbottom" style="padding-top: 28px;" colspan="6"><xsl:value-of select="background/backgroundtrait[position() &lt;= 1]"/><br /><xsl:value-of select="background/backgroundtrait[position() &gt;= 2 and (position() &lt; 3)]"/></td>
					</tr>
					<tr>
						<td class="subtitle" colspan="6">Personality Traits</td>
					</tr>
					<tr>
						<td class="borderbottom" colspan="6"><xsl:value-of select="background/backgroundtrait[position() &gt;= 3 and (position() &lt; 4)]"/></td>
					</tr>
					<tr>
						<td class="subtitle" colspan="6">Ideal</td>
					</tr>
					<tr>
						<td class="borderbottom" colspan="6"><xsl:value-of select="background/backgroundtrait[position() &gt;= 4 and (position() &lt; 5)]"/></td>
					</tr>
					<tr>
						<td class="subtitle" colspan="6">Bond</td>
					</tr>
					<tr>
						<td class="borderbottom" colspan="6"><xsl:value-of select="background/backgroundtrait[position() &gt;= 5 and (position() &lt; 6)]"/></td>
					</tr>
					<tr>
						<td class="subtitle" colspan="6">Flaw</td>
					</tr>
				</table>
				<table width="100%">
					<tr>
						<td colspan="2" style="padding-top: 28px;" class="borderbottomblack">Proficiencies</td>
					</tr>
					<tr>
						<td width="50%"><strong>Armour:</strong><xsl:call-template name="space"/><xsl:value-of select="armorproficiencies/@text"/></td>
						<td width="50%"><strong>Tools:</strong><xsl:call-template name="space"/><xsl:value-of select="toolproficiencies/@text"/></td>
					</tr>
					<tr>
						<td><strong>Weapons:</strong><xsl:call-template name="space"/><xsl:value-of select="weaponproficiencies/@text"/></td>
						<td><strong>Languages:</strong><xsl:call-template name="space"/><xsl:apply-templates select="languages/language"/></td>
					</tr>
				</table>
			</section>
			<section>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="borderbottomblack">Equipment</td>
					</tr>
				</table>
			</section>
			<section id="left-50">
				<table width="100%">
					<xsl:apply-templates select="gear/item[position() &lt;= (last() div 2)]"/>
				</table>
			</section>
			<section id="right-50">
				<table width="100%">
					<xsl:apply-templates select="gear/item[position() &gt;= (last() div 2)]"/>
				</table>
			</section>
			<section id="full-width">
			</section>
			<section id="left-50">
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="borderbottomblack">Treasure</td>
					</tr>
					<tr>
						<td class="borderbottom"><strong>Coins:</strong><xsl:call-template name="space"/><xsl:value-of select="money/@total"/></td>
					</tr>
					<tr>
						<td class="borderbottom"><strong>Valuables:</strong><xsl:call-template name="space"/><xsl:if test="money/@valuables = 0">None!</xsl:if><xsl:if test="money/@valuables != 0"><xsl:value-of select="money/@valuables"/></xsl:if></td>
					</tr>
				</table>
			</section>
			<section id="right-50">
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="borderbottomblack">Magic Items</td>
					</tr>
					<tr>
						<td><xsl:if test="count(magicitems/item) = 0">None!</xsl:if><xsl:if test="count(magicitems/item) != 0"><xsl:apply-templates select="magicitems/item"/></xsl:if></td>
					</tr>
				</table>
			</section>
			<section id="full-width">
				<p class="legal">Hero Lab(R) and the Hero Lab logo are Registered Trademarks of LWD Technology, Inc. Free download at <a href="http://www.wolflair.com/">http://www.wolflair.com/</a>.<br/>5e Character Sheet designed by Corey Sonnenberg and coded by Dave McAlister/<a href="https://dnd5e.info">DnD5e.info</a>.</p>
			</section>
			<div style="page-break-before: always;"></div>
			<section>
				<table width="100%">
					<tr>
						<td style="padding-top:28px;" class="borderbottomblack">Ability Descriptions</td>
					</tr>
				</table>
				<div style="-webkit-column-count: 2; -moz-column-count: 2; column-count: 2; padding-top:28px;">
				<table width="100%">
					<xsl:if test="racespells/spellability != 0">
					<tr>
						<td class="borderbottom"><strong><xsl:value-of select="racespells/spellability/@name"/></strong></td>
					</tr>
					<tr>
						<td><strong>Casting Time:</strong><xsl:call-template name="space"/><xsl:value-of select="racespells/spellability/@casttime"/></td>
					</tr>
					<tr>
						<td><strong>Range:</strong><xsl:call-template name="space"/><xsl:value-of select="racespells/spellability/@range"/></td>
					</tr>
					<tr>
						<td><strong>Components:</strong><xsl:call-template name="space"/><xsl:value-of select="racespells/spellability/@componenttext"/></td>
					</tr>
					<tr>
						<td><strong>Duration:</strong><xsl:call-template name="space"/><xsl:value-of select="racespells/spellability/@duration"/></td>
					</tr>
					<tr>
						<td style="padding-bottom:28px;"><pre><xsl:value-of select="racespells/spellability/description"/></pre></td>
					</tr>
					</xsl:if>
					<xsl:for-each select="feats/feat"> 
					<tr>
						<td class="borderbottom"><strong><xsl:value-of select="@name"/></strong></td>
					</tr>
					<tr>
						<td style="padding-bottom:28px;"><pre><xsl:value-of select="description"/></pre></td>
					</tr>
					</xsl:for-each>
					<xsl:for-each select="traits/trait"> 
					<tr>
						<td class="borderbottom"><strong><xsl:value-of select="@name"/></strong></td>
					</tr>
					<tr>
						<td style="padding-bottom:28px;"><pre><xsl:value-of select="description"/></pre></td>
					</tr>
					</xsl:for-each>
					<xsl:for-each select="*/special"> 
					<tr>
						<td class="borderbottom"><strong><xsl:value-of select="@name"/></strong></td>
					</tr>
					<tr>
						<td style="padding-bottom:28px;"><pre><xsl:value-of select="description"/></pre></td>
					</tr>
					</xsl:for-each>
				</table>
				</div>
			</section>
			<xsl:if test="count(spellbook/spell) != 0">
			<div style="page-break-before: always;"></div>
			<section>
				<table width="100%">
					<tr>
						<td colspan="3" style="padding-top:28px;" class="borderbottomblack">Spell Sheet</td>
					</tr>
					<tr>
						<td style="padding-top: 28px;"><strong>Spellcasting Ability:</strong><xsl:call-template name="space"/><xsl:value-of select="classes/class/@spellability"/></td>
						<td style="padding-top: 28px;"><strong>Spell Save DC:</strong><xsl:call-template name="space"/><xsl:value-of select="classes/class/@spellsavedc"/></td>
						<td style="padding-top: 28px;"><strong>Spell Attack Bonus:</strong><xsl:call-template name="space"/><xsl:value-of select="classes/class/@spellattack"/></td>
					</tr>
					<tr>
						<td colspan="3" style="padding-top: 28px;" class="borderbottomblack">Spellbook</td>
					</tr>
				</table>
				<div style="-webkit-column-count: 2; -moz-column-count: 2; column-count: 2; padding-top:28px;">
				<table width="100%">
					<tr>
						<td class="spellslot">Cantrips</td>
					</tr>
					<xsl:for-each select="cantrips/spell"> 
					<tr> 
						<td class="borderbottom"><xsl:value-of select="@name"/></td>
					</tr> 
					</xsl:for-each>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">1st-Level <xsl:apply-templates select="spellslots/spellslot[position() &lt;= 1]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellbook/spell[@level='1']">
							<xsl:apply-templates select="spellbook/spell[@level='1']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">2nd-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 2 and (position() &lt; 3)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellbook/spell[@level='2']">
							<xsl:apply-templates select="spellbook/spell[@level='2']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">3rd-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 3 and (position() &lt; 4)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellbook/spell[@level='3']">
							<xsl:apply-templates select="spellbook/spell[@level='3']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">4th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 4 and (position() &lt; 5)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellbook/spell[@level='4']">
							<xsl:apply-templates select="spellbook/spell[@level='4']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">5th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 5 and (position() &lt; 6)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellbook/spell[@level='5']">
							<xsl:apply-templates select="spellbook/spell[@level='5']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">6th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 6 and (position() &lt; 7)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellbook/spell[@level='6']">
							<xsl:apply-templates select="spellbook/spell[@level='6']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">7th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 7 and (position() &lt; 8)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellbook/spell[@level='7']">
							<xsl:apply-templates select="spellbook/spell[@level='7']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">8th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 8 and (position() &lt; 9)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellbook/spell[@level='8']">
							<xsl:apply-templates select="spellbook/spell[@level='8']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">9th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 9 and (position() &lt; 10)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellbook/spell[@level='9']">
							<xsl:apply-templates select="spellbook/spell[@level='9']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				</div>
			</section>
			</xsl:if>
			<xsl:if test="count(spellbook/spell) != 0">
			<div style="page-break-before: always;"></div>
			<section>
				<table width="100%">
					<tr>
						<td colspan="4" style="padding-top:28px;" class="borderbottomblack">Spell Descriptions</td>
					</tr>
				</table>
				<div style="-webkit-column-count: 2; -moz-column-count: 2; column-count: 2; padding-top:28px;">
				<table width="100%">
					<xsl:for-each select="cantrips/spell">
					<tr>
						<td class="borderbottom"><strong><xsl:value-of select="@name"/></strong></td>
					</tr>
					<tr>
						<td><strong>Casting Time:</strong><xsl:call-template name="space"/><xsl:value-of select="@casttime"/></td>
					</tr>
					<tr>
						<td><strong>Range:</strong><xsl:call-template name="space"/><xsl:value-of select="@range"/></td>
					</tr>
					<tr>
						<td><strong>Components:</strong><xsl:call-template name="space"/><xsl:value-of select="@componenttext"/></td>
					</tr>
					<tr>
						<td><strong>Duration:</strong><xsl:call-template name="space"/><xsl:value-of select="@duration"/></td>
					</tr>
					<tr>
						<td style="padding-bottom:28px;"><pre><xsl:value-of select="description"/></pre></td>
					</tr>
					</xsl:for-each>
					<xsl:for-each select="spellbook/spell">
					<tr>
						<td class="borderbottom"><strong><xsl:value-of select="@name"/></strong></td>
					</tr>
					<tr>
						<td><strong>Casting Time:</strong><xsl:call-template name="space"/><xsl:value-of select="@casttime"/></td>
					</tr>
					<tr>
						<td><strong>Range:</strong><xsl:call-template name="space"/><xsl:value-of select="@range"/></td>
					</tr>
					<tr>
						<td><strong>Components:</strong><xsl:call-template name="space"/><xsl:value-of select="@componenttext"/></td>
					</tr>
					<tr>
						<td><strong>Duration:</strong><xsl:call-template name="space"/><xsl:value-of select="@duration"/></td>
					</tr>
					<tr>
						<td style="padding-bottom:28px;"><pre><xsl:value-of select="description"/></pre></td>
					</tr>
					</xsl:for-each>
				</table>
				</div>
			</section>
			</xsl:if>
			<xsl:if test="count(spellsknown/spell) != 0">
			<div style="page-break-before: always;"></div>
			<section>
				<table width="100%">
					<tr>
						<td colspan="3" style="padding-top:28px;" class="borderbottomblack">Spell Sheet</td>
					</tr>
					<tr>
						<td style="padding-top: 28px;"><strong>Spellcasting Ability:</strong><xsl:call-template name="space"/><xsl:value-of select="classes/class/@spellability"/></td>
						<td style="padding-top: 28px;"><strong>Spell Save DC:</strong><xsl:call-template name="space"/><xsl:value-of select="classes/class/@spellsavedc"/></td>
						<td style="padding-top: 28px;"><strong>Spell Attack Bonus:</strong><xsl:call-template name="space"/><xsl:value-of select="classes/class/@spellattack"/></td>
					</tr>
					<tr>
						<td colspan="3" style="padding-top: 28px;" class="borderbottomblack">Spells Known</td>
					</tr>
				</table>
			</section>
			<section>
				<div style="-webkit-column-count: 2; -moz-column-count: 2; column-count: 2; padding-top:28px;">
				<table width="100%">
					<tr>
						<td class="spellslot">Cantrips</td>
					</tr>
					<xsl:choose>
						<xsl:when test="cantrips">
							<xsl:apply-templates select="cantrips" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">1st-Level <xsl:apply-templates select="spellslots/spellslot[position() &lt;= 1]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsknown/spell[@level='1']">
							<xsl:apply-templates select="spellsknown/spell[@level='1']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">2nd-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 2 and (position() &lt; 3)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsknown/spell[@level='2']">
							<xsl:apply-templates select="spellsknown/spell[@level='2']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">3rd-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 3 and (position() &lt; 4)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsknown/spell[@level='3']">
							<xsl:apply-templates select="spellsknown/spell[@level='3']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">4th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 4 and (position() &lt; 5)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsknown/spell[@level='4']">
							<xsl:apply-templates select="spellsknown/spell[@level='4']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">5th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 5 and (position() &lt; 6)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsknown/spell[@level='5']">
							<xsl:apply-templates select="spellsknown/spell[@level='5']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">6th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 6 and (position() &lt; 7)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsknown/spell[@level='6']">
							<xsl:apply-templates select="spellsknown/spell[@level='6']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">7th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 7 and (position() &lt; 8)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsknown/spell[@level='7']">
							<xsl:apply-templates select="spellsknown/spell[@level='7']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">8th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 8 and (position() &lt; 9)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsknown/spell[@level='8']">
							<xsl:apply-templates select="spellsknown/spell[@level='8']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">9th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 9 and (position() &lt; 10)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsknown/spell[@level='9']">
							<xsl:apply-templates select="spellsknown/spell[@level='9']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				</div>
			</section>
			</xsl:if>
			<xsl:if test="count(spellsknown/spell) != 0">
			<div style="page-break-before: always;"></div>
			<section>
				<table width="100%">
					<tr>
						<td colspan="4" style="padding-top:28px;" class="borderbottomblack">Spell Descriptions</td>
					</tr>
				</table>
				<div style="-webkit-column-count: 2; -moz-column-count: 2; column-count: 2; padding-top:28px;">
				<table width="100%">
					<xsl:for-each select="cantrips/spell">
					<tr>
						<td class="borderbottom"><strong><xsl:value-of select="@name"/></strong></td>
					</tr>
					<tr>
						<td><strong>Casting Time:</strong><xsl:call-template name="space"/><xsl:value-of select="@casttime"/></td>
					</tr>
					<tr>
						<td><strong>Range:</strong><xsl:call-template name="space"/><xsl:value-of select="@range"/></td>
					</tr>
					<tr>
						<td><strong>Components:</strong><xsl:call-template name="space"/><xsl:value-of select="@componenttext"/></td>
					</tr>
					<tr>
						<td><strong>Duration:</strong><xsl:call-template name="space"/><xsl:value-of select="@duration"/></td>
					</tr>
					<tr>
						<td style="padding-bottom:28px;"><pre><xsl:value-of select="description"/></pre></td>
					</tr>
					</xsl:for-each>
					<xsl:for-each select="spellsknown/spell">
					<tr>
						<td class="borderbottom"><strong><xsl:value-of select="@name"/></strong></td>
					</tr>
					<tr>
						<td><strong>Casting Time:</strong><xsl:call-template name="space"/><xsl:value-of select="@casttime"/></td>
					</tr>
					<tr>
						<td><strong>Range:</strong><xsl:call-template name="space"/><xsl:value-of select="@range"/></td>
					</tr>
					<tr>
						<td><strong>Components:</strong><xsl:call-template name="space"/><xsl:value-of select="@componenttext"/></td>
					</tr>
					<tr>
						<td><strong>Duration:</strong><xsl:call-template name="space"/><xsl:value-of select="@duration"/></td>
					</tr>
					<tr>
						<td style="padding-bottom:28px;"><pre><xsl:value-of select="description"/></pre></td>
					</tr>
					</xsl:for-each>
				</table>
				</div>
			</section>
			</xsl:if>
			<xsl:if test="count(spellsmemorized/spell) != 0">
			<div style="page-break-before: always;"></div>
			<section>
				<table width="100%">
					<tr>
						<td colspan="3" style="padding-top:28px;" class="borderbottomblack">Spell Sheet</td>
					</tr>
					<tr>
						<td style="padding-top: 28px;"><strong>Spellcasting Ability:</strong><xsl:call-template name="space"/><xsl:value-of select="classes/class/@spellability"/></td>
						<td style="padding-top: 28px;"><strong>Spell Save DC:</strong><xsl:call-template name="space"/><xsl:value-of select="classes/class/@spellsavedc"/></td>
						<td style="padding-top: 28px;"><strong>Spell Attack Bonus:</strong><xsl:call-template name="space"/><xsl:value-of select="classes/class/@spellattack"/></td>
					</tr>
					<tr>
						<td colspan="3" style="padding-top: 28px;" class="borderbottomblack">Spells Known</td>
					</tr>
				</table>
			</section>
			<section>
				<div style="-webkit-column-count: 2; -moz-column-count: 2; column-count: 2; padding-top:28px;">
				<table width="100%">
					<tr>
						<td class="spellslot">1st-Level <xsl:apply-templates select="spellslots/spellslot[position() &lt;= 1]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsmemorized/spell[@level='1']">
							<xsl:apply-templates select="spellsmemorized/spell[@level='1']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">2nd-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 2 and (position() &lt; 3)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsmemorized/spell[@level='2']">
							<xsl:apply-templates select="spellsmemorized/spell[@level='2']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">3rd-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 3 and (position() &lt; 4)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsmemorized/spell[@level='3']">
							<xsl:apply-templates select="spellsmemorized/spell[@level='3']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">4th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 4 and (position() &lt; 5)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsmemorized/spell[@level='4']">
							<xsl:apply-templates select="spellsmemorized/spell[@level='4']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">5th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 5 and (position() &lt; 6)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsmemorized/spell[@level='5']">
							<xsl:apply-templates select="spellsmemorized/spell[@level='5']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">6th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 6 and (position() &lt; 7)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsmemorized/spell[@level='6']">
							<xsl:apply-templates select="spellsmemorized/spell[@level='6']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">7th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 7 and (position() &lt; 8)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsmemorized/spell[@level='7']">
							<xsl:apply-templates select="spellsmemorized/spell[@level='7']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">8th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 8 and (position() &lt; 9)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsmemorized/spell[@level='8']">
							<xsl:apply-templates select="spellsmemorized/spell[@level='8']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				<table width="100%">
					<tr>
						<td style="padding-top: 28px;" class="spellslot">9th-Level <xsl:apply-templates select="spellslots/spellslot[position() &gt;= 9 and (position() &lt; 10)]"/></td>
					</tr>
					<xsl:choose>
						<xsl:when test="spellsmemorized/spell[@level='9']">
							<xsl:apply-templates select="spellsmemorized/spell[@level='9']" />
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
					<tr>
						<td height="16px;" class="borderbottom"></td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
				</div>
			</section>
			</xsl:if>
			<xsl:if test="count(spellsmemorized/spell) != 0">
			<div style="page-break-before: always;"></div>
			<section>
				<table width="100%">
					<tr>
						<td colspan="4" style="padding-top:28px;" class="borderbottomblack">Spell Descriptions</td>
					</tr>
				</table>
				<div style="-webkit-column-count: 2; -moz-column-count: 2; column-count: 2; padding-top:28px;">
				<table width="100%">
					<xsl:for-each select="spellsmemorized/spell">
					<tr>
						<td class="borderbottom"><strong><xsl:value-of select="@name"/></strong></td>
					</tr>
					<tr>
						<td><strong>Casting Time:</strong><xsl:call-template name="space"/><xsl:value-of select="@casttime"/></td>
					</tr>
					<tr>
						<td><strong>Range:</strong><xsl:call-template name="space"/><xsl:value-of select="@range"/></td>
					</tr>
					<tr>
						<td><strong>Components:</strong><xsl:call-template name="space"/><xsl:value-of select="@componenttext"/></td>
					</tr>
					<tr>
						<td><strong>Duration:</strong><xsl:call-template name="space"/><xsl:value-of select="@duration"/></td>
					</tr>
					<tr>
						<td style="padding-bottom:28px;"><pre><xsl:value-of select="description"/></pre></td>
					</tr>
					</xsl:for-each>
				</table>
				</div>
			</section>
			</xsl:if>
			
			<div style="page-break-before: always;"></div>
	</xsl:template>

	<xsl:template match="movement">
		<xsl:value-of select="speed/@text"/>
	</xsl:template>
	
	<xsl:template match="abilityscore">
		<td class="square" height="30px"><xsl:value-of select="abilvalue/@text"/></td><td style="text-transform: uppercase; text-align: center; font-size: 14pt;"><strong><xsl:value-of select="@name"/></strong></td><td class="square"><xsl:value-of select="abilbonus/@text"/></td><td class="square"><xsl:value-of select="savingthrow/@text"/></td><td style="font-size: 14pt;"><xsl:choose>
			<xsl:when test="savingthrow/@isproficient = 'yes'">
				&#9679;
			</xsl:when>
			<xsl:otherwise>
				&#9675;
			</xsl:otherwise>
		</xsl:choose></td>
	</xsl:template>

	<xsl:template match="save">
		<li><xsl:value-of select="@name"/>: <strong><xsl:value-of select="@save"/></strong></li>
	</xsl:template>

	<xsl:template match="skill">
		<tr><td height="30px" style="font-size: 14pt;"><xsl:choose><xsl:when test="@isproficient = 'yes'">&#9679;</xsl:when><xsl:otherwise>&#9675;</xsl:otherwise></xsl:choose></td><td class="square" width="30px"><xsl:if test="@value >= 0">+</xsl:if><xsl:value-of select="@value"/></td><td><strong><xsl:value-of select="@name"/></strong><!-- <span style="font-size: 8pt; color: #808080;">(<xsl:value-of select="@abilabbreviation"/>)</span>--><span style="font-size: 6pt; float: right; text-align: right;"><xsl:choose><xsl:when test="@name = 'Perception'"><em>passive<br />perception</em></xsl:when><xsl:otherwise></xsl:otherwise></xsl:choose></span></td><xsl:choose><xsl:when test="@name = 'Perception'"><td class="square" width="30px"><xsl:value-of select="@passive"/></td></xsl:when><xsl:otherwise><td></td></xsl:otherwise></xsl:choose></tr>
	</xsl:template>

	<xsl:template match="feat | trait | special">
					<tr>
						<td colspan="3" class="borderbottom"><xsl:value-of select="@name"/></td>
					</tr>
	</xsl:template>
	
	<xsl:template match="spellslot">
		<span style="float: right;"><xsl:value-of select="@count"/></span>
	</xsl:template>

	<xsl:template match="spell">
					<tr>
						<td class="borderbottom"><xsl:value-of select="@name"/></td>
					</tr>
	</xsl:template>

	<xsl:template match="weapon">
		<tr>
			<td class="borderbottom"><xsl:value-of select="@name"/></td>
			<td class="borderbottom"><xsl:value-of select="@attack"/></td>
			<td class="borderbottom"><xsl:value-of select="@damage"/></td>
		</tr>
	</xsl:template>

	<xsl:template match="item">
					<tr>
						<td class="borderbottom"><xsl:value-of select="@name"/><xsl:if test="@quantity != 1">
		(x<xsl:value-of select="@quantity"/>)</xsl:if></td>
					</tr>
	</xsl:template>

  <xsl:template match="language">
    <xsl:if test="position() != 1">
      <xsl:text>; </xsl:text>
      </xsl:if>
    <xsl:value-of select="@name"/></xsl:template>

	<xsl:template match="image">
		<img class="portrait" style="position: absolute; top: 55px; left: 480px; z-index: -100;"><xsl:attribute name="src"><xsl:value-of select="@filename"/></xsl:attribute></img>
	</xsl:template>

</xsl:stylesheet>
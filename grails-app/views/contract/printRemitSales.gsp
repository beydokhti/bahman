<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="printLayout">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<script>
    var printpage = function () {
        $(this).remove();
        window.print();
    }
</script>

%{---------------------------------------------------------------------------}%
<html>

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1256">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 14">
<meta name=Originator content="Microsoft Word 14">
<link rel=File-List href="شماره%20قرارداد%20بورس_files/filelist.xml">
<style>
<!--
    /* Font Definitions */
@font-face {
    font-family: Cambria;
    panose-1: 2 4 5 3 5 4 6 3 2 4;
    mso-font-charset: 0;
    mso-generic-font-family: roman;
    mso-font-pitch: variable;
    mso-font-signature: -536870145 1073743103 0 0 415 0;
}

@font-face {
    font-family: Calibri;
    panose-1: 2 15 5 2 2 2 4 3 2 4;
    mso-font-charset: 0;
    mso-generic-font-family: swiss;
    mso-font-pitch: variable;
    mso-font-signature: -536870145 1073786111 1 0 415 0;
}

@font-face {
    font-family: "B Nazanin";
    panose-1: 0 0 4 0 0 0 0 0 0 0;
    mso-font-charset: 178;
    mso-generic-font-family: auto;
    mso-font-pitch: variable;
    mso-font-signature: 8193 -2147483648 8 0 64 0;
}

    /* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal {
    mso-style-unhide: no;
    mso-style-qformat: yes;
    mso-style-parent: "";
    margin-top: 0in;
    margin-right: 0in;
    margin-bottom: 10.0pt;
    margin-left: 0in;
    line-height: 115%;
    mso-pagination: widow-orphan;
    font-size: 11.0pt;
    font-family: "Calibri", "sans-serif";
    mso-ascii-font-family: Calibri;
    mso-ascii-theme-font: minor-latin;
    mso-fareast-font-family: Calibri;
    mso-fareast-theme-font: minor-latin;
    mso-hansi-font-family: Calibri;
    mso-hansi-theme-font: minor-latin;
    mso-bidi-font-family: Arial;
    mso-bidi-theme-font: minor-bidi;
}

.MsoChpDefault {
    mso-style-type: export-only;
    mso-default-props: yes;
    font-family: "Calibri", "sans-serif";
    mso-ascii-font-family: Calibri;
    mso-ascii-theme-font: minor-latin;
    mso-fareast-font-family: Calibri;
    mso-fareast-theme-font: minor-latin;
    mso-hansi-font-family: Calibri;
    mso-hansi-theme-font: minor-latin;
    mso-bidi-font-family: Arial;
    mso-bidi-theme-font: minor-bidi;
}

.MsoPapDefault {
    mso-style-type: export-only;
    margin-bottom: 10.0pt;
    line-height: 115%;
}

@page WordSection1 {
    size: 8.5in 11.0in;
    margin: 1.0in 1.0in 1.0in 1.0in;
    mso-header-margin: .5in;
    mso-footer-margin: .5in;
    mso-paper-source: 0;
}

div.WordSection1 {
    page: WordSection1;
}

-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin-top:0in;
	mso-para-margin-right:0in;
	mso-para-margin-bottom:10.0pt;
	mso-para-margin-left:0in;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;}
</style>
<![endif]-->
</head>

<body lang=EN-US style='tab-interval:.5in'>

<div class=WordSection1>

<div align=right>

<table class=MsoNormalTable dir=rtl border=0 cellspacing=0 cellpadding=0
       width=626 style='width:469.5pt;margin-left:4.65pt;border-collapse:collapse;
mso-yfti-tbllook:1184;mso-padding-alt:0in 5.4pt 0in 5.4pt;mso-table-dir:bidi'>
<tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:13.5pt'>
    <td width=26 nowrap style='width:19.7pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=80 nowrap style='width:60.3pt;border:none;border-bottom:solid windowtext 1.0pt;
    mso-border-bottom-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>شماره قرارداد بورس</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=96 nowrap colspan=2 style='width:72.15pt;border:none;border-bottom:
    solid windowtext 1.0pt;mso-border-bottom-alt:solid windowtext .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                dir=RTL></span><b><span lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;color:black'><span
                dir=RTL></span>${contractInstance.contractNo}/${contractInstance.contractPartNo}</span></b></p>
    </td>
    <td width=423 nowrap colspan=9 style='width:317.35pt;border:none;border-bottom:
    solid windowtext 1.0pt;mso-border-bottom-alt:solid windowtext .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>حواله فروش محصول - داخل&#1740;</span></b><b><span dir=LTR
                                                                               style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                               "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                               color:black'></span></b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:1;height:13.5pt'>
    <td width=26 nowrap rowspan=3 style='width:19.7pt;border-top:solid black 1.0pt;
    border-left:none;border-bottom:solid black 1.0pt;border-right:solid windowtext 1.0pt;
    mso-border-top-alt:solid black .5pt;mso-border-bottom-alt:solid black .5pt;
    mso-border-right-alt:solid windowtext .5pt;background:#F2F2F2;padding:0in 5.4pt 0in 5.4pt;
    mso-rotate:90;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>مشخصات فروشنده</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=80 nowrap style='width:60.3pt;border:none;border-right:solid windowtext 1.0pt;
    mso-border-right-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نام فروشنده :</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=102 nowrap colspan=3 style='width:76.45pt;border:none;mso-border-top-alt:
    solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>
            ${contractInstance?.manufacturer?.sellerName}
        </span>
        </b>
        </p>
    </td>
    <td width=73 nowrap style='width:54.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=right dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:left;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>کد اقتصاد&#1740; :</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=65 colspan=2 style='width:49.05pt;border:none;mso-border-top-alt:
    solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${manufacturer?.businessId}</span>
        </b></p>
    </td>
    <td width=54 nowrap style='width:40.6pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>کدپست&#1740; :</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=76 nowrap style='width:57.25pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${contractInstance?.manufacturer?.postalCode}</span>
        </b></p>
    </td>
    <td width=73 nowrap style='width:54.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>شماره حواله :</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=34 nowrap style='width:.35in;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:8.0pt;font-family:"Cambria","serif";
        mso-fareast-font-family:"Times New Roman";mso-bidi-font-family:"Times New Roman";
        color:black'>
        %{--draftNo mtb13--}%
            </span></b></p>
    </td>
    <td width=43 nowrap style='width:31.95pt;border:none;border-left:solid windowtext 1.0pt;
    mso-border-left-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=right dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:right;line-height:normal'><b><span style='font-size:8.0pt;
        font-family:"Cambria","serif";mso-fareast-font-family:"Times New Roman";
        mso-bidi-font-family:"Times New Roman";color:black'>${draftNo}</span></b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:2;height:13.5pt'>
    <td width=80 nowrap style='width:60.3pt;border:none;border-right:solid windowtext 1.0pt;
    mso-border-right-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>محل تحو&#1740;ل :</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=102 nowrap colspan=3 style='width:76.45pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>
            %{--${contractInstance?.placeOfUnloading}--}%
            %{--محل تخلیه--}%
        </span></b></p>
    </td>
    <td width=73 nowrap style='width:54.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>تلفن :</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=65 nowrap colspan=2 style='width:49.05pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${contractInstance?.manufacturer?.phoneNo}</span>
        </b></p>
    </td>
    <td width=54 nowrap style='width:40.6pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=76 nowrap style='width:57.25pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=73 nowrap style='width:54.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>تار&#1740;خ :</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=76 nowrap colspan=2 style='width:57.15pt;border:none;border-left:
    solid black 1.0pt;mso-border-left-alt:solid black .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'><rg:formatJalaliDate
                date="${draftDate}"></rg:formatJalaliDate></span></b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:3;height:45.0pt'>
    <td width=320 nowrap colspan=7 style='width:240.3pt;border-top:none;
    border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
    mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:45.0pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>
            ${contractInstance?.manufacturer?.address}
        </span></b></p>
    </td>
    <td width=54 nowrap style='width:40.6pt;border:none;border-bottom:solid windowtext 1.0pt;
    mso-border-bottom-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:45.0pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>تلفن :</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=76 nowrap style='width:57.25pt;border:none;border-bottom:solid windowtext 1.0pt;
    mso-border-bottom-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:45.0pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${contractInstance?.manufacturer?.phoneNo}</span>
        </b></p>
    </td>
    <td width=73 nowrap style='width:54.5pt;border:none;border-bottom:solid windowtext 1.0pt;
    mso-border-bottom-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:45.0pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                dir=RTL></span><b><span lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;color:black'><span dir=RTL></span><span
                style='mso-spacerun:yes'> </span>فکس :</span></b><b><span dir=LTR
                                                                          style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                          "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                          color:black'></span></b></p>
    </td>
    <td width=76 nowrap colspan=2 style='width:57.15pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-left-alt:solid black .5pt;mso-border-bottom-alt:
    solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:45.0pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${contractInstance?.manufacturer?.fax}</span>
        </b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:4;height:13.5pt'>
    <td width=26 nowrap style='width:19.7pt;border:none;border-bottom:solid windowtext 1.0pt;
    mso-border-bottom-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>&nbsp;</span></p>
    </td>
    <td width=80 nowrap valign=bottom style='width:60.3pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=39 nowrap valign=bottom style='width:29.45pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=57 nowrap valign=bottom style='width:42.7pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=6 nowrap valign=bottom style='width:4.3pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=73 nowrap valign=bottom style='width:54.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=4 nowrap valign=bottom style='width:2.95pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=61 nowrap valign=bottom style='width:46.1pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=54 nowrap valign=bottom style='width:40.6pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=76 nowrap valign=bottom style='width:57.25pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=73 nowrap valign=bottom style='width:54.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=34 nowrap valign=bottom style='width:.35in;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=43 nowrap valign=bottom style='width:31.95pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
</tr>
<tr style='mso-yfti-irow:5;height:13.5pt'>
    <td width=26 nowrap rowspan=3 style='width:19.7pt;border-top:none;border-left:
    none;border-bottom:solid black 1.0pt;border-right:solid windowtext 1.0pt;
    mso-border-bottom-alt:solid black .5pt;mso-border-right-alt:solid windowtext .5pt;
    background:#F2F2F2;padding:0in 5.4pt 0in 5.4pt;mso-rotate:90;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>مشخصات خر&#1740;دار</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=120 nowrap colspan=2 style='width:89.75pt;border-top:solid windowtext 1.0pt;
    border-left:none;border-bottom:none;border-right:solid windowtext 1.0pt;
    mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نام خر&#1740;دار :</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=139 colspan=4 style='width:104.45pt;border:none;border-top:solid windowtext 1.0pt;
    mso-border-top-alt:solid windowtext .5pt;background:#D9D9D9;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>
            ${contractInstance?.customer?.description}
        </span></b></p>
    </td>
    <td width=116 nowrap colspan=2 style='width:86.7pt;border:none;border-top:
    solid windowtext 1.0pt;mso-border-top-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>کد خر&#1740;دار :</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=225 nowrap colspan=4 style='width:168.9pt;border-top:solid windowtext 1.0pt;
    border-left:solid black 1.0pt;border-bottom:none;border-right:none;
    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid black .5pt;
    background:#D9D9D9;padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${contractInstance?.customer?.code}</span>
        </b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:6;height:13.5pt'>
    <td width=80 nowrap style='width:60.3pt;border:none;border-right:solid windowtext 1.0pt;
    mso-border-right-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نشان&#1740; :</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=294 nowrap colspan=7 style='width:220.6pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span lang=AR-SA dir=RTL
                                                               style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:Calibri;
                                                               mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                                                               color:black'>
            ${contractInstance?.customer?.address}
        </span></b></p>
    </td>
    <td width=149 nowrap colspan=2 style='width:111.75pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>شناسه مل&#1740; :</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=76 nowrap colspan=2 style='width:57.15pt;border:none;border-left:
    solid black 1.0pt;mso-border-left-alt:solid black .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${contractInstance?.customer?.nId}</span>
        </b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:7;height:48.0pt'>
    <td width=120 nowrap colspan=2 style='width:89.75pt;border-top:none;
    border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
    mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:48.0pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>کد اقتصاد&#1740; :</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=63 nowrap colspan=2 style='width:47.0pt;border:none;border-bottom:
    solid windowtext 1.0pt;mso-border-bottom-alt:solid windowtext .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:48.0pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${contractInstance?.customer?.businessId}</span>
        </b></p>
    </td>
    <td width=73 nowrap style='width:54.5pt;border:none;border-bottom:solid windowtext 1.0pt;
    mso-border-bottom-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:48.0pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>کد پست&#1740; :</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=65 nowrap colspan=2 style='width:49.05pt;border:none;border-bottom:
    solid windowtext 1.0pt;mso-border-bottom-alt:solid windowtext .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:48.0pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${contractInstance?.customer?.postalCode}</span>
        </b></p>
    </td>
    <td width=54 nowrap style='width:40.6pt;border:none;border-bottom:solid windowtext 1.0pt;
    mso-border-bottom-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:48.0pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>تلفن :</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=225 nowrap colspan=4 style='width:168.9pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-left-alt:solid black .5pt;mso-border-bottom-alt:
    solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:48.0pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${contractInstance?.customer?.phoneNo}</span>
        </b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:8;height:13.5pt'>
    <td width=26 nowrap style='width:19.7pt;padding:0in 5.4pt 0in 5.4pt;
    mso-rotate:90;height:13.5pt'></td>
    <td width=80 nowrap style='width:60.3pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=39 nowrap style='width:29.45pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=57 nowrap style='width:42.7pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=6 nowrap style='width:4.3pt;padding:0in 5.4pt 0in 5.4pt;height:
    13.5pt'></td>
    <td width=73 nowrap style='width:54.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=4 nowrap style='width:2.95pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=61 nowrap style='width:46.1pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=54 nowrap style='width:40.6pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=76 nowrap style='width:57.25pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=73 nowrap style='width:54.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=34 nowrap style='width:.35in;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
    <td width=43 nowrap style='width:31.95pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'></td>
</tr>
<tr style='mso-yfti-irow:9;height:13.5pt'>
    <td width=26 rowspan=2 style='width:19.7pt;border-top:solid windowtext 1.0pt;
    border-left:none;border-bottom:solid black 1.0pt;border-right:solid windowtext 1.0pt;
    mso-border-top-alt:solid windowtext .5pt;mso-border-bottom-alt:solid black .5pt;
    mso-border-right-alt:solid windowtext .5pt;background:#F2F2F2;padding:0in 5.4pt 0in 5.4pt;
    mso-rotate:90;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>مشخصات باربر&#1740;</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=80 nowrap style='width:60.3pt;border-top:solid windowtext 1.0pt;
    border-left:none;border-bottom:none;border-right:solid windowtext 1.0pt;
    mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نام باربر&#1740; :</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=519 nowrap colspan=11 style='width:389.5pt;border-top:solid windowtext 1.0pt;
    border-left:solid black 1.0pt;border-bottom:none;border-right:none;
    mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid black .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span lang=AR-SA dir=RTL
                                                               style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:Calibri;
                                                               mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                                                               color:black'>
            ${contractInstance?.freight}
        </span></b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:10;height:51.75pt'>
    <td width=80 nowrap style='width:60.3pt;border-top:none;border-left:none;
    border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
    mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:51.75pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>محل تخل&#1740;ه :</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=519 nowrap colspan=11 style='width:389.5pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-left-alt:solid black .5pt;mso-border-bottom-alt:
    solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:51.75pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span lang=AR-SA dir=RTL
                                                               style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:Calibri;
                                                               mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                                                               color:black'>
            ${contractInstance?.placeOfUnloading}
        </span></b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:11;height:11.25pt'>
    <td width=26 nowrap valign=bottom style='width:19.7pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=80 nowrap valign=bottom style='width:60.3pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=39 nowrap valign=bottom style='width:29.45pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=57 nowrap valign=bottom style='width:42.7pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=6 nowrap valign=bottom style='width:4.3pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=73 nowrap valign=bottom style='width:54.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=4 nowrap valign=bottom style='width:2.95pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=61 nowrap valign=bottom style='width:46.1pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=54 nowrap valign=bottom style='width:40.6pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=76 nowrap valign=bottom style='width:57.25pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=73 nowrap valign=bottom style='width:54.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=34 nowrap valign=bottom style='width:.35in;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
    <td width=43 nowrap valign=bottom style='width:31.95pt;padding:0in 5.4pt 0in 5.4pt;
    height:11.25pt'></td>
</tr>
<tr style='mso-yfti-irow:12;height:13.5pt'>
    <td width=26 nowrap rowspan=2 style='width:19.7pt;border:solid windowtext 1.0pt;
    border-bottom:solid black 1.0pt;mso-border-alt:solid windowtext .5pt;
    mso-border-bottom-alt:solid black .5pt;background:#DBEEF3;padding:0in 5.4pt 0in 5.4pt;
    mso-rotate:90;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>مشخصات محصول</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=80 nowrap style='width:60.3pt;border:solid windowtext 1.0pt;
    border-right:none;mso-border-right-alt:solid windowtext .5pt;mso-border-alt:
    solid windowtext .5pt;background:#DBEEF3;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نماد کالا</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=175 nowrap colspan=4 style='width:130.95pt;border-top:solid windowtext 1.0pt;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-right-alt:solid windowtext .5pt;mso-border-alt:
    solid windowtext .5pt;mso-border-left-alt:solid black .5pt;background:#DBEEF3;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>شرح محصول</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=65 nowrap colspan=2 style='width:49.05pt;border-top:solid windowtext 1.0pt;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-right-alt:solid windowtext .5pt;mso-border-alt:
    solid windowtext .5pt;mso-border-left-alt:solid black .5pt;background:#DBEEF3;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>مقدار(ک&#1740;لوگرم)</span></b><b><span dir=LTR
                                                                     style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                     "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                     color:black'></span></b></p>
    </td>
    <td width=130 nowrap colspan=2 style='width:97.85pt;border-top:solid windowtext 1.0pt;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-right-alt:solid windowtext .5pt;mso-border-alt:
    solid windowtext .5pt;mso-border-left-alt:solid black .5pt;background:#DBEEF3;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>ق&#1740;مت واحد(ر&#1740;ال)</span></b><b><span dir=LTR
                                                                            style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                            "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                            color:black'></span></b></p>
    </td>
    <td width=149 nowrap colspan=3 style='width:111.65pt;border-top:solid windowtext 1.0pt;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-right-alt:solid windowtext .5pt;mso-border-alt:
    solid windowtext .5pt;mso-border-left-alt:solid black .5pt;background:#DBEEF3;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>ق&#1740;مت کل(ر&#1740;ال)</span></b><b><span dir=LTR
                                                                          style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                          "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                          color:black'></span></b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:13;height:62.25pt'>
    <td width=80 nowrap style='width:60.3pt;border:none;border-left:solid windowtext 1.0pt;
    mso-border-right-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
    mso-border-right-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:62.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${contractInstance?.productSymbol}</span>
        </b></p>
    </td>
    <td width=175 nowrap colspan=4 style='width:130.95pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:
    solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;mso-border-left-alt:
    solid black .5pt;padding:0in 5.4pt 0in 5.4pt;height:62.25pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>
            ${contractInstance?.productDesc}
        </span></b><b><span
                dir=LTR style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                color:black'></span></b></p>
    </td>
    <td width=65 nowrap colspan=2 style='width:49.05pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:
    solid black .5pt;mso-border-top-alt:windowtext;mso-border-left-alt:black;
    mso-border-bottom-alt:windowtext;mso-border-right-alt:black;mso-border-style-alt:
    solid;mso-border-width-alt:.5pt;background:white;padding:0in 5.4pt 0in 5.4pt;
    height:62.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${quantity}</span></b></p>
    </td>
    <td width=130 nowrap colspan=2 style='width:97.85pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:
    solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;mso-border-left-alt:
    solid black .5pt;padding:0in 5.4pt 0in 5.4pt;height:62.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${price}</span></b></p>
    </td>
    <td width=149 nowrap colspan=3 style='width:111.65pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:
    solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;mso-border-left-alt:
    solid black .5pt;padding:0in 5.4pt 0in 5.4pt;height:62.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${contractValue}</span></b>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow:14;height:13.5pt'>
    <td width=26 nowrap rowspan=2 style='width:19.7pt;border-top:none;border-left:
    solid windowtext 1.0pt;border-bottom:solid black 1.0pt;border-right:solid windowtext 1.0pt;
    mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:solid black .5pt;
    mso-border-right-alt:solid windowtext .5pt;background:#DBEEF3;padding:0in 5.4pt 0in 5.4pt;
    mso-rotate:90;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>عوارض ومال&#1740;ات</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=451 nowrap colspan=9 style='width:338.15pt;border-top:solid windowtext 1.0pt;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-right-alt:solid windowtext .5pt;mso-border-alt:
    solid windowtext .5pt;mso-border-left-alt:solid black .5pt;background:white;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>%6
        </span></b><b><span lang=AR-SA dir=RTL style='font-size:8.0pt;font-family:
        "B Nazanin";mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;color:black'>مال&#1740;ات بر ارزش افزوده</span></b><span
                dir=LTR></span><b><span lang=AR-SA style='font-size:8.0pt;mso-ascii-font-family:
        Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
        mso-bidi-font-family:"B Nazanin";color:black'><span dir=LTR></span></span></b><b><span
                style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                color:black'></span></b></p>
    </td>
    <td width=149 nowrap colspan=3 style='width:111.65pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:
    solid black .5pt;mso-border-top-alt:windowtext;mso-border-left-alt:black;
    mso-border-bottom-alt:windowtext;mso-border-right-alt:black;mso-border-style-alt:
    solid;mso-border-width-alt:.5pt;padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${addedTax}</span></b>
        </p>
    </td>
</tr>
<tr style='mso-yfti-irow:15;height:59.25pt'>
    <td width=451 nowrap colspan=9 style='width:338.15pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:
    solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;mso-border-left-alt:
    solid black .5pt;background:white;padding:0in 5.4pt 0in 5.4pt;height:59.25pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>کسر کارمزد کارگزار، بورس و سازمان بورس</span></b><b><span
                dir=LTR style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                color:black'></span></b></p>
    </td>
    <td width=149 nowrap colspan=3 style='width:111.65pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:
    solid black .5pt;mso-border-top-alt:windowtext;mso-border-left-alt:black;
    mso-border-bottom-alt:windowtext;mso-border-right-alt:black;mso-border-style-alt:
    solid;mso-border-width-alt:.5pt;padding:0in 5.4pt 0in 5.4pt;height:59.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${fees}</span></b></p>
    </td>
</tr>
<tr style='mso-yfti-irow:16;height:13.5pt'>
    <td width=477 nowrap colspan=10 style='width:357.85pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
    mso-border-top-alt:windowtext;mso-border-left-alt:black;mso-border-bottom-alt:
    windowtext;mso-border-right-alt:black;mso-border-style-alt:solid;mso-border-width-alt:
    .5pt;background:#DBEEF3;padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>سهم فروشنده</span></b><b><span dir=LTR style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=149 nowrap colspan=3 style='width:111.65pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:
    solid black .5pt;mso-border-top-alt:windowtext;mso-border-left-alt:black;
    mso-border-bottom-alt:windowtext;mso-border-right-alt:black;mso-border-style-alt:
    solid;mso-border-width-alt:.5pt;background:#DBEEF3;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><span style='font-size:8.0pt;
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'>${shareSeller}</span></p>
    </td>
</tr>
<tr style='mso-yfti-irow:17;height:13.5pt'>
    <td width=626 nowrap colspan=13 style='width:469.5pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:none;border-right:solid black 1.0pt;
    mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
    mso-border-left-alt:solid black .5pt;mso-border-right-alt:solid black .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                dir=RTL></span><span style='font-size:8.0pt;font-family:"B Nazanin";
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;color:black'><span dir=RTL></span><span
                style='mso-spacerun:yes'> </span><span lang=AR-SA>* خر&#1740;دار متعهد
        م&#1740;گردد که مشمول قانون منع مداخله مصوب 1337 نم&#1740; باشد.</span></span><span
                dir=LTR style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                color:black'></span></p>
    </td>
</tr>
<tr style='mso-yfti-irow:18;height:13.5pt'>
    <td width=626 colspan=13 style='width:469.5pt;border-top:none;border-left:
    solid black 1.0pt;border-bottom:none;border-right:solid black 1.0pt;
    mso-border-left-alt:solid black .5pt;mso-border-right-alt:solid black .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                dir=RTL></span><span lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;color:black'><span dir=RTL></span><span
                style='mso-spacerun:yes'> </span>* خر&#1740;دار حداقل 48 ساعت پس ازصدورحواله
        وبا هماهنگ&#1740; م&#1740; تواند جهت حمل به مجتمع مراجعه نما&#1740;د . مهلت
        اعتبار ا&#1740;ن حواله ازتار&#1740;خ صدور&#1740;کماه ودرصورت عدم حمل
        و&#1740;ا معرف&#1740; کام&#1740;ون توسط خر&#1740;دار باطل و&#1740;ا
        باق&#1740;مانده حواله باطل خواهدشد .</span><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></p>
    </td>
</tr>
<tr style='mso-yfti-irow:19;height:13.5pt'>
    <td width=626 colspan=13 style='width:469.5pt;border-top:none;border-left:
    solid black 1.0pt;border-bottom:none;border-right:solid black 1.0pt;
    mso-border-left-alt:solid black .5pt;mso-border-right-alt:solid black .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                dir=RTL></span><span lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;color:black'><span dir=RTL></span><span
                style='mso-spacerun:yes'> </span>* درصورت عدم تحو&#1740;ل محصول توسط مجتمع
        (بجزکالا&#1740; واردات&#1740; وضا&#1740;عات&#1740;) درطول60روز ازتار&#1740;خ
        صدورحواله بعدازمهلت 60روز مانده تحو&#1740;ل نشده وابطال نشده مشمول
        اعطا&#1740; 1.5درصد کارمزد به صورت روزشمار برا&#1740; هر30روز نسبت به مبلغ
        نقد&#1740; پرداخت شده خواهدبود که درهنگام صدورصورتحساب به حساب
        بستانکار&#1740; مشتر&#1740; منظور خواهد شد.</span><span dir=LTR
                                                                style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                color:black'></span></p>
    </td>
</tr>
<tr style='mso-yfti-irow:20;height:13.5pt'>
    <td width=626 nowrap colspan=13 style='width:469.5pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:none;border-right:solid black 1.0pt;
    mso-border-left-alt:solid black .5pt;mso-border-right-alt:solid black .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                dir=RTL></span><span lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;color:black'><span dir=RTL></span><span
                style='mso-spacerun:yes'> </span>* هرگونه تغ&#1740;&#1740;راحتمال&#1740; ق&#1740;مت
        محصول وتعد&#1740;ل تخف&#1740;فات درآ&#1740;نده مشمول ا&#1740;ن حواله
        نخواهدبود وصوررتحساب بانرخ ا&#1740;ن حواله محاسبه وصادرم&#1740;گردد.</span><span
                dir=LTR style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                color:black'></span></p>
    </td>
</tr>
<tr style='mso-yfti-irow:21;height:13.5pt'>
    <td width=626 nowrap colspan=13 style='width:469.5pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:none;border-right:solid black 1.0pt;
    mso-border-left-alt:solid black .5pt;mso-border-right-alt:solid black .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                dir=RTL></span><span lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;color:black'><span dir=RTL></span><span
                style='mso-spacerun:yes'> </span>* محل تحو&#1740;ل کالا انبار
        پتروش&#1740;م&#1740; جم م&#1740; باشد وخر&#1740;دار پس از تحو&#1740;ل گرفتن
        کالا جهت در&#1740;افت صورتحساب وتسو&#1740;ه حساب به حسابدار&#1740; فروش
        مراجعه فرما&#1740;ند.</span><span dir=LTR style='font-size:8.0pt;mso-ascii-font-family:
        Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
        mso-bidi-font-family:"B Nazanin";color:black'></span></p>
    </td>
</tr>
<tr style='mso-yfti-irow:22;height:13.5pt'>
    <td width=626 colspan=13 style='width:469.5pt;border-top:none;border-left:
    solid black 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
    mso-border-left-alt:solid black .5pt;mso-border-bottom-alt:solid windowtext .5pt;
    mso-border-right-alt:solid black .5pt;padding:0in 5.4pt 0in 5.4pt;height:
    13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                dir=RTL></span><span lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";
        mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;color:black'><span dir=RTL></span><span
                style='mso-spacerun:yes'> </span>* مدت زمان مجاز حمل محصولات جدول فوق ,
        حداکثر 10 روز پس ازصدورحواله م&#1740; باشدوپس از انقضاء زمان مجاز به عنوان
        هز&#1740;نه انباردار&#1740; , روزانه 3% ازوزن کالا&#1740; باق&#1740;مانده
        کسرم&#1740;گردد.</span><span dir=LTR style='font-size:8.0pt;mso-ascii-font-family:
        Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
        mso-bidi-font-family:"B Nazanin";color:black'></span></p>
    </td>
</tr>
<tr style='mso-yfti-irow:23;height:13.5pt'>
    <td width=203 nowrap colspan=4 style='width:152.15pt;border:solid windowtext 1.0pt;
    border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نام وامضاءکارشناس فروش</span><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></p>
    </td>
    <td width=198 nowrap colspan=5 style='width:148.45pt;border-top:none;
    border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:
    solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نام وامضاء تائ&#1740;دکننده در&#1740;افت وجه</span><span
                dir=LTR style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                color:black'></span></p>
    </td>
    <td width=225 nowrap colspan=4 style='width:168.9pt;border-top:none;
    border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:
    solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نام وامضاء تحو&#1740;ل گ&#1740;رنده حواله</span><span dir=LTR
                                                                                   style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                                   "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                                   color:black'></span></p>
    </td>
</tr>
<tr style='mso-yfti-irow:24;height:13.5pt'>
    <td width=203 nowrap colspan=4 style='width:152.15pt;border:solid windowtext 1.0pt;
    border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
    padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نام وامضاء تائ&#1740;دکننده</span><span dir=LTR
                                                                     style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                     "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                     color:black'></span></p>
    </td>
    <td width=198 nowrap colspan=5 style='width:148.45pt;border-top:none;
    border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:
    solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نام وامضاء تصو&#1740;ب کننده</span><span dir=LTR
                                                                      style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                      "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                      color:black'></span></p>
    </td>
    <td width=225 colspan=4 style='width:168.9pt;border-top:none;border-left:
    solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:
    none;mso-border-top-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
    mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:13.5pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>تار&#1740;خ تحو&#1740;ل محصول<span
                    style='mso-spacerun:yes'>            </span>امضاء</span><span dir=LTR
                                                                                  style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                                  "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                                  color:black'></span></p>
    </td>
</tr>
<tr style='mso-yfti-irow:25;mso-yfti-lastrow:yes;height:13.5pt'>
    <td width=146 nowrap colspan=3 style='width:109.45pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نسخه شماره1 بازرگان&#1740;</span></b><b><span dir=LTR
                                                                           style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                           "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                           color:black'></span></b></p>
    </td>
    <td width=135 nowrap colspan=3 style='width:101.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>
            نسخه شماره 2${contractInstance?.manufacturer?.sellerName}
        </span></b><b><span dir=LTR
                            style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                            "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                            color:black'></span></b>
        </p>
    </td>
    <td width=120 nowrap colspan=3 style='width:89.65pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نسخه شماره 3 مال&#1740;</span></b><b><span dir=LTR
                                                                        style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                        "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                        color:black'></span></b></p>
    </td>
    <td width=149 nowrap colspan=2 style='width:111.75pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نسخه شماره 4 انبار</span></b><b><span dir=LTR style='font-size:
        8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:"Times New Roman";
        mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";color:black'></span></b></p>
    </td>
    <td width=76 nowrap colspan=2 style='width:57.15pt;padding:0in 5.4pt 0in 5.4pt;
    height:13.5pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:8.0pt;font-family:"B Nazanin";mso-ascii-font-family:
                Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
                color:black'>نسخه شماره 5 خر&#1740;دار</span></b><b><span dir=LTR
                                                                          style='font-size:8.0pt;mso-ascii-font-family:Calibri;mso-fareast-font-family:
                                                                          "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:"B Nazanin";
                                                                          color:black'></span></b></p>
    </td>
</tr>
</table>

</div>

</div>


%{---------------------------------------------------------------------------}%
<div class="row">
    <div class="span2 offset6"><input id="printButton" type="button" value="${message(code: 'index.Print.label')}">
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#printButton").on("click", printpage)
    })
</script>
</div>

</body>

</html>
</body>
</html>
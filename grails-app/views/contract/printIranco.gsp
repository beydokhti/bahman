<%@ page import="com.sun.corba.se.impl.logging.ORBUtilSystemException; bahman.Contract" %>
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
<html>

<head>
    <meta http-equiv=Content-Type content="text/html; charset=windows-1256">
    <meta name=Generator content="Microsoft Word 14 (filtered)">
    <style>
    <!--
        /* Font Definitions */
    @font-face
    {font-family:Calibri;
        panose-1:2 15 5 2 2 2 4 3 2 4;}
    @font-face
    {font-family:Tahoma;
        panose-1:2 11 6 4 3 5 4 4 2 4;}
    @font-face
    {font-family:"B Nazanin";
        panose-1:0 0 4 0 0 0 0 0 0 0;}
        /* Style Definitions */
    p.MsoNormal, li.MsoNormal, div.MsoNormal
    {margin-top:0in;
        margin-right:0in;
        margin-bottom:10.0pt;
        margin-left:0in;
        line-height:115%;
        font-size:11.0pt;
        font-family:"Calibri","sans-serif";}
    p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
    {mso-style-link:"Balloon Text Char";
        margin:0in;
        margin-bottom:.0001pt;
        font-size:8.0pt;
        font-family:"Tahoma","sans-serif";}
    span.BalloonTextChar
    {mso-style-name:"Balloon Text Char";
        mso-style-link:"Balloon Text";
        font-family:"Tahoma","sans-serif";}
    .MsoPapDefault
    {margin-bottom:10.0pt;
        line-height:115%;}
    @page WordSection1
    {size:8.5in 11.0in;
        margin:27.0pt 63.0pt 0in 45.0pt;}
    div.WordSection1
    {page:WordSection1;}
    -->
    </style>

</head>

<body lang=EN-US>

<div class=WordSection1>

<div align=right>

<table class=MsoNormalTable dir=rtl border=0 cellspacing=0 cellpadding=0
       width=633 style='width:475.0pt;margin-left:4.65pt;border-collapse:collapse'>
<tr style='height:15.0pt'>
    <td width=507 nowrap colspan=4 rowspan=5 valign=bottom style='width:380.0pt;
    border-top:solid windowtext 1.0pt;border-left:none;border-bottom:solid black 1.0pt;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:15.0pt'>
        <p class=MsoNormal align=right dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:right;line-height:normal'><b><span style='color:black'>&nbsp;</span></b><img
                width=183 height=102 id="Picture 2" src="${resource(dir: "images",file:"taminNovin.png")}"alt=logo></p>
    </td>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border-top:solid windowtext 1.0pt;
    border-left:solid windowtext 1.0pt;border-bottom:none;border-right:none;
    padding:0in 5.4pt 0in 5.4pt;height:15.0pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:15.0pt'>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border:none;
    border-left:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:15.0pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-family:"B Nazanin";color:black'>شماره :</span><span>${letterNo}</span></b></p>
    </td>
</tr>
<tr style='height:.25in'>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border:none;
    border-left:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:.25in'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-family:"B Nazanin";color:black'>تار&#1740;خ:</span></b><b><span
                dir=LTR style='color:black'>&nbsp;${letterDate}&nbsp;</span></b><span dir=RTL></span><b><span
                style='font-family:"B Nazanin";color:black'><span dir=RTL></span> </span></b></p>
    </td>
</tr>
<tr style='height:20.25pt'>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border:none;
    border-left:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:20.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-family:"B Nazanin";color:black'>پ&#1740;وست:</span></b></p>
    </td>
</tr>
<tr style='height:14.25pt'>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border-top:none;
    border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;padding:0in 5.4pt 0in 5.4pt;height:14.25pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:14.25pt'>
    <td width=180 nowrap valign=bottom style='width:135.0pt;border:none;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:14.25pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='color:black'>&nbsp;</span></b></p>
    </td>
    <td width=98 nowrap valign=bottom style='width:73.15pt;padding:0in 5.4pt 0in 5.4pt;
    height:14.25pt'></td>
    <td width=79 nowrap valign=bottom style='width:59.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:14.25pt'></td>
    <td width=150 nowrap valign=bottom style='width:112.35pt;padding:0in 5.4pt 0in 5.4pt;
    height:14.25pt'></td>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border:none;
    border-left:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:14.25pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:18.75pt'>
    <td width=278 nowrap colspan=2 valign=bottom style='width:208.15pt;
    border:none;border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;
    height:18.75pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:12.0pt;font-family:"B Nazanin";color:black'>مد&#1740;ر&#1740;ت
            محترم فروش و بازار&#1740;اب&#1740;</span></b></p>
    </td>
    <td width=79 nowrap valign=bottom style='width:59.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:18.75pt'></td>
    <td width=150 nowrap valign=bottom style='width:112.35pt;padding:0in 5.4pt 0in 5.4pt;
    height:18.75pt'></td>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border:none;
    border-left:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:18.75pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:18.75pt'>
    <td width=180 nowrap valign=bottom style='width:135.0pt;border:none;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:18.75pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:12.0pt;font-family:"B Nazanin";color:black'>شرکت
            ا&#1740;رالکو</span></b></p>
    </td>
    <td width=98 nowrap valign=bottom style='width:73.15pt;padding:0in 5.4pt 0in 5.4pt;
    height:18.75pt'></td>
    <td width=79 nowrap valign=bottom style='width:59.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:18.75pt'></td>
    <td width=150 nowrap valign=bottom style='width:112.35pt;padding:0in 5.4pt 0in 5.4pt;
    height:18.75pt'></td>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border:none;
    border-left:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:18.75pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:18.75pt'>
    <td width=180 nowrap valign=bottom style='width:135.0pt;border:none;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:18.75pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:12.0pt;font-family:"B Nazanin";color:black'>با
            سلام و تقد&#1740;م احترام؛</span></b></p>
    </td>
    <td width=98 nowrap valign=bottom style='width:73.15pt;padding:0in 5.4pt 0in 5.4pt;
    height:18.75pt'></td>
    <td width=79 nowrap valign=bottom style='width:59.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:18.75pt'></td>
    <td width=150 nowrap valign=bottom style='width:112.35pt;padding:0in 5.4pt 0in 5.4pt;
    height:18.75pt'></td>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border:none;
    border-left:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:18.75pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:57.75pt'>
    <td width=633 colspan=5 valign=top style='width:475.0pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:none;border-right:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;height:57.75pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>به
            اطلاع م&#1740; رساند در تار&#1740;خ </span></b><b><span dir=LTR
                                                                    style='font-size:10.5pt;color:black'><rg:formatJalaliDate date="${contractInstance.contractDate}"></rg:formatJalaliDate></span></b><span dir=RTL></span><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'><span
                    dir=RTL></span> طبق شماره گواه&#1740;نامه شماره</span></b><b><span dir=LTR
                                                                                       style='font-size:10.5pt;color:black'>${contractInstance.contractNo}/${contractInstance.contractPartNo}</span></b><span dir=RTL></span><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'><span
                    dir=RTL></span> مقدار </span></b><b><span dir=LTR style='font-size:10.5pt;
        color:black'>${quantity}</span></b><span dir=RTL></span><b><span lang=AR-SA
                                                                   style='font-size:10.5pt;font-family:"B Nazanin";color:black'><span dir=RTL></span>
            ک&#1740;لو گرم کالا به شرح ذ&#1740;ل در بورس فلزات معامله گرد&#1740;د. دستور
            فرما&#1740;&#1740;دطبق مقررات بورس فلزات اقدامات لازم جهت صدور حواله  و دستور
            حمل به مقصد خر&#1740;دار صادر گردد.</span></b></p>
    </td>
</tr>
<tr style='height:23.25pt'>
    <td width=180 nowrap style='width:135.0pt;border:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;height:23.25pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>نام
            کالا</span></b></p>
    </td>
    <td width=98 nowrap style='width:73.15pt;border:solid windowtext 1.0pt;
    border-right:none;padding:0in 5.4pt 0in 5.4pt;height:23.25pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>مقدار
            ک&#1740;لوگرم</span></b></p>
    </td>
    <td width=79 nowrap style='width:59.5pt;border:solid windowtext 1.0pt;
    border-right:none;padding:0in 5.4pt 0in 5.4pt;height:23.25pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>هر
            ک&#1740;لوگرم</span></b></p>
    </td>
    <td width=150 nowrap style='width:112.35pt;border:solid windowtext 1.0pt;
    border-right:none;padding:0in 5.4pt 0in 5.4pt;height:23.25pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>ارزش
            محصول به ر&#1740;ال</span></b></p>
    </td>
    <td width=127 nowrap style='width:95.0pt;border:solid windowtext 1.0pt;
    border-right:none;padding:0in 5.4pt 0in 5.4pt;height:23.25pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>محل
            تحو&#1740;ل</span></b></p>
    </td>
</tr>
<tr style='height:23.25pt'>
    <td width=180 nowrap style='width:135.0pt;border:solid windowtext 1.0pt;
    border-top:none;padding:0in 5.4pt 0in 5.4pt;height:23.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>${contractInstance?.productDesc}</span></b></p>
    </td>
    <td width=98 nowrap style='width:73.15pt;border-top:none;border-left:solid windowtext 1.0pt;
    border-bottom:solid windowtext 1.0pt;border-right:none;padding:0in 5.4pt 0in 5.4pt;
    height:23.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>${quantity} </span></b></p>
    </td>
    <td width=79 nowrap style='width:59.5pt;border-top:none;border-left:solid windowtext 1.0pt;
    border-bottom:solid windowtext 1.0pt;border-right:none;padding:0in 5.4pt 0in 5.4pt;
    height:23.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>${price}</span></b></p>
    </td>
    <td width=150 nowrap style='width:112.35pt;border-top:none;border-left:solid windowtext 1.0pt;
    border-bottom:solid windowtext 1.0pt;border-right:none;padding:0in 5.4pt 0in 5.4pt;
    height:23.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>${contractValue}</span></b></p>
    </td>
    <td width=127 nowrap style='width:95.0pt;border-top:none;border-left:solid windowtext 1.0pt;
    border-bottom:solid windowtext 1.0pt;border-right:none;padding:0in 5.4pt 0in 5.4pt;
    height:23.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>${contractInstance.deliveryPlace}</span></b></p>
    </td>
</tr>
<tr style='height:9.75pt'>
    <td width=180 nowrap valign=bottom style='width:135.0pt;border:none;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:9.75pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
    <td width=98 nowrap valign=bottom style='width:73.15pt;padding:0in 5.4pt 0in 5.4pt;
    height:9.75pt'></td>
    <td width=79 nowrap valign=bottom style='width:59.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:9.75pt'></td>
    <td width=150 nowrap valign=bottom style='width:112.35pt;padding:0in 5.4pt 0in 5.4pt;
    height:9.75pt'></td>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border:none;
    border-left:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:9.75pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=278 nowrap colspan=2 valign=bottom style='width:208.15pt;
    border-top:none;border-left:solid black 1.0pt;border-bottom:none;border-right:
    solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>نام
            کارگزار خر&#1740;دار: </span></b><b><span dir=LTR style='font-size:10.5pt;
        color:black'>${contractInstance.buyerBrokerDesc}</span></b></p>
    </td>
    <td width=356 nowrap colspan=3 valign=bottom style='width:266.85pt;
    border-top:solid windowtext 1.0pt;border-left:solid black 1.0pt;border-bottom:
    solid windowtext 1.0pt;border-right:none;padding:0in 5.4pt 0in 5.4pt;
    height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>مبلغ </span></b><b><span
                dir=LTR style='font-size:10.5pt;color:black'>${fees}</span></b><span
                dir=RTL></span><b><span lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";
        color:black'><span dir=RTL></span> ر&#1740;ال- جمع کارمزد فروشنده</span></b></p>
    </td>
</tr>
<tr style='height:14.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:none;border-right:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;height:14.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>نام
            مشتر&#1740;: </span></b><b><span dir=LTR style='font-size:10.5pt;color:black'>${contractInstance.customerDesc}</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=278 nowrap colspan=2 valign=bottom style='width:208.15pt;
    border-top:none;border-left:solid black 1.0pt;border-bottom:none;border-right:
    solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>نوع
            معاملات: </span></b><b><span dir=LTR style='font-size:10.5pt;color:black'>${contractInstance.contractType}</span></b></p>
    </td>
    <td width=356 nowrap colspan=3 valign=bottom style='width:266.85pt;
    border-top:solid windowtext 1.0pt;border-left:solid black 1.0pt;border-bottom:
    solid windowtext 1.0pt;border-right:none;padding:0in 5.4pt 0in 5.4pt;
    height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>مبلغ</span></b><b><span
                dir=LTR style='font-size:10.5pt;color:black'>${shareSeller}</span></b><span
                dir=RTL></span><b><span lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";
        color:black'><span dir=RTL></span> ر&#1740;ال- خالص سهم
        فروشنده</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:none;border-right:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>نوع
            تسو&#1740;ه معاملات: </span></b><b><span dir=LTR style='font-size:10.5pt;
        color:black'>${contractInstance.settlementType}</span></b><span dir=RTL></span><b><span style='font-size:
        10.5pt;font-family:"B Nazanin";color:black'><span dir=RTL></span> </span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:none;border-right:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>تار&#1740;خ
            وار&#1740;ز و در&#1740;افت وجه از مشتر&#1740;: </span></b><b><span dir=LTR
                                                                               style='font-size:10.5pt;color:black'>
            <g:if test="${contractInstance?.settlementDate}">
            <rg:formatJalaliDate date ="${contractInstance?.settlementDate}">
            </rg:formatJalaliDate></span></b></p>
            </g:if>
    </td>
</tr>
<tr style='height:17.25pt'><td width=633 colspan=5 valign=top style='width:475.0pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:none;border-right:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
        lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>آدرس
        طبق اظهار خر&#1740;دار: </span></b><b><span dir=LTR style='font-size:10.5pt; max-width:475.0pt;
        color:black'>${contractInstance.placeOfUnloading}</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>آدرس
            و نام باربر&#1740;: </span></b><b><span dir=LTR style='font-size:10.5pt;
        color:black'>${contractInstance?.freight}</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=180 nowrap valign=bottom style='width:135.0pt;border:solid windowtext 1.0pt;
    border-top:none;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>کد
            اقتصاد&#1740;</span></b></p>
    </td>
    <td width=177 nowrap colspan=2 valign=bottom style='width:132.65pt;
    border-top:none;border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>کد
            پست&#1740;</span></b></p>
    </td>
    <td width=276 nowrap colspan=2 valign=bottom style='width:207.35pt;
    border-top:none;border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>شناسه
            مل&#1740;</span></b></p>
    </td>
</tr>
<tr style='height:16.5pt'>
    <td width=180 nowrap style='width:135.0pt;border:solid windowtext 1.0pt;
    border-top:none;padding:0in 5.4pt 0in 5.4pt;height:16.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>${contractInstance?.customer?.businessId}</span></b></p>
    </td>
    <td width=177 nowrap colspan=2 style='width:132.65pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;padding:0in 5.4pt 0in 5.4pt;height:16.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>${contractInstance?.customer?.postalCode}</span></b></p>
    </td>
    <td width=276 nowrap colspan=2 style='width:207.35pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;padding:0in 5.4pt 0in 5.4pt;height:16.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>${contractInstance?.customer?.nId}</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>توض&#1740;حات:
        </span></b></p>
    </td>
</tr>
<tr style='height:21.75pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:none;border-right:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;height:21.75pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>شرا&#1740;ط
            تسو&#1740;ه معاملات تحو&#1740;ل کالاتا 5+ و 6- درصد مقدار خر&#1740;د از طرف
            فروشنده قابل تغ&#1740;&#1740;ر م&#1740; باشد.</span></b></p>
    </td>
</tr>
<tr style='height:.5in'>
    <td width=633 colspan=5 valign=top style='width:475.0pt;border-top:none;
    border-left:solid black 1.0pt;border-bottom:none;border-right:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;height:.5in'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>ا&#1740;ن
            کارگزار&#1740; ضمن اعلام وصول کارمزد و حق سهم السهم توسعه بورس و هز&#1740;نه
            ها&#1740; بورس تعهد م&#1740; نما&#1740;د هر گونه کسورات قانون&#1740; اعم از
            مال&#1740;ات و غ&#1740;ره به عهده ا&#1740;ن کارگزار&#1740; م&#1740; باشد.
            بنحو&#1740; که ه&#1740;چ گونه مسئول&#1740;ت&#1740; متوجه آن شرکت نگردد.</span></b></p>
    </td>
</tr>
<tr style='height:20.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:20.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>کل&#1740;ه
            محتو&#1740;ات فرم به صورت تا&#1740;پ شده و بدون خط خوردگ&#1740; معتبر
            م&#1740; باشد.</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:none;border-right:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>مال&#1740;ات
            بر ارزش افزوده  کل محصول فروخته شده معادل</span></b><b><span dir=LTR
                                                                         style='font-size:10.5pt;color:black'>${addedTax}</span></b><span dir=RTL></span><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'><span
                    dir=RTL></span> ر&#1740;ال م&#1740; با&#1740;ست توسط مشتر&#1740; به حساب
            کارخانه وار&#1740;ز گردد.</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=180 nowrap valign=bottom style='width:135.0pt;border:none;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
    <td width=98 nowrap valign=bottom style='width:73.15pt;padding:0in 5.4pt 0in 5.4pt;
    height:17.25pt'></td>
    <td width=79 nowrap valign=bottom style='width:59.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:17.25pt'></td>
    <td width=150 nowrap valign=bottom style='width:112.35pt;padding:0in 5.4pt 0in 5.4pt;
    height:17.25pt'></td>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border:none;
    border-left:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:none;border-right:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                dir=RTL></span><b><span lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";
        color:black;margin-right: 175px;'><span dir=RTL></span>                                                                                                                             
        با احترام </span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:none;border-right:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal align=right dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:left;line-height:normal;direction:rtl;unicode-bidi:embed'><span
                dir=RTL></span><b><span lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";
        color:black'><span dir=RTL></span>                                                                                            
                      شرکت کارگزار&#1740; تام&#1740;ن سرما&#1740;ه نو&#1740;ن</span></b></p>
    </td>
</tr>
<tr style='height:15.75pt'>
    <td width=278 nowrap colspan=2 valign=bottom style='width:208.15pt;
    border:none;border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;
    height:15.75pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>ارجاعات</span></b></p>
    </td>
    <td width=356 nowrap colspan=3 valign=bottom style='width:266.85pt;
    border:none;border-left:solid black 1.0pt;padding:0in 5.4pt 0in 5.4pt;
    height:15.75pt'>
        <p class=MsoNormal align=center dir=RTL style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>ثبت
            دب&#1740;ر خانه حوزه معاونت فروش و صادرات شرکت</span></b></p>
    </td>
</tr>
<tr style='height:22.5pt'>
    <td width=180 nowrap valign=bottom style='width:135.0pt;border:none;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:22.5pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
    <td width=98 nowrap valign=bottom style='width:73.15pt;padding:0in 5.4pt 0in 5.4pt;
    height:22.5pt'></td>
    <td width=356 nowrap colspan=3 valign=bottom style='width:266.85pt;
    border:solid windowtext 1.0pt;border-left:solid black 1.0pt;padding:0in 5.4pt 0in 5.4pt;
    height:22.5pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:7.5pt'>
    <td width=180 nowrap valign=bottom style='width:135.0pt;border-top:none;
    border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
    padding:0in 5.4pt 0in 5.4pt;height:7.5pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
    <td width=98 nowrap valign=bottom style='width:73.15pt;border:none;
    border-bottom:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:7.5pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
    <td width=79 nowrap valign=bottom style='width:59.5pt;border:none;border-bottom:
    solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:7.5pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
    <td width=150 nowrap valign=bottom style='width:112.35pt;border:none;
    border-bottom:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:7.5pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border-top:none;
    border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:none;padding:0in 5.4pt 0in 5.4pt;height:7.5pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:21.75pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:21.75pt'>
        <p class=MsoNormal align=center dir=LTR style='margin-bottom:0in;margin-bottom:
        .0001pt;text-align:center;line-height:normal'><b><span style='font-size:10.5pt;
        color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=278 nowrap colspan=2 valign=bottom style='width:208.15pt;
    border:none;border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;
    height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>چهار
            راه ول&#1740;عصر، ساختمان ابر&#1740;شم ، طبقه 5، واحد 3</span></b></p>
    </td>
    <td width=79 nowrap valign=bottom style='width:59.5pt;padding:0in 5.4pt 0in 5.4pt;
    height:17.25pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
    <td width=150 nowrap valign=bottom style='width:112.35pt;padding:0in 5.4pt 0in 5.4pt;
    height:17.25pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
    <td width=127 nowrap valign=bottom style='width:95.0pt;border:none;
    border-left:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=LTR style='margin-bottom:0in;margin-bottom:.0001pt;
        line-height:normal'><b><span style='font-size:10.5pt;color:black'>&nbsp;</span></b></p>
    </td>
</tr>
<tr style='height:17.25pt'>
    <td width=633 nowrap colspan=5 valign=bottom style='width:475.0pt;border-top:
    none;border-left:solid black 1.0pt;border-bottom:solid windowtext 1.0pt;
    border-right:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:17.25pt'>
        <p class=MsoNormal dir=RTL style='margin-bottom:0in;margin-bottom:.0001pt;
        text-align:right;line-height:normal;direction:rtl;unicode-bidi:embed'><b><span
                lang=AR-SA style='font-size:10.5pt;font-family:"B Nazanin";color:black'>تلفن:63419000      
            نمابر: 63419333       </span></b><b><span dir=LTR style='font-size:10.5pt;
        color:black'>ime@nibb.ir</span></b></p>
    </td>
</tr>
</table>

</div>

<p class=MsoNormal dir=RTL style='text-align:right;direction:rtl;unicode-bidi:
embed'><span dir=LTR>&nbsp;</span></p>

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

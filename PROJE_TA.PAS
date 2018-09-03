program proje_takip_programi;{NAZIM YILMAZ---BiLGiSAYAR TEK.& PROG. 2. ôGR./B}
uses crt,printer;
type
kayit=record
ograd,proad:string[50];
w,ogrno,prono:longint;
f:char;
end;
var
tus:char;
dosya:file of kayit;
dos:kayit;
sat,n:byte;
u,o,q,c,a:string;
t,x,ara,b,i,g,w,sec:longint;
label giris,cikis;
      PROCEDURE yukle;
begin   normvideo;
clrscr;
repeat
if i=75 then clrscr;
GOTOXY(23,25);
if i<100 then textcolor(green);
if i<75 then textcolor(yellow);
if i<50 then textcolor(blue);
if i<25 then textcolor(red);
writeln('.............YöKLENDi.............');
writeln;
i:=i+1; SOUND(i*10);
gotoxy(38,23);
write('%',i);delay(35);
if i=100 then break;



until 1=3;   NOSOUND;
end;
                  PROCEDURE sifre;
                  var
                  n:byte;
                  tus,g,c,k,s:string;
                  i,v:integer;
                  label dogrulama,gir,dogru,yanlis;
                  begin
                  normvideo;textbackground(black);clrscr;
                  gotoxy(10,10);write('BÅyÅk/KÅáÅk Harfe Duyarlçdçr');
                  g:='NAZIM'; (*g degiskeni kullançcç adçdçr*)
                  c:='SMYO';   (*c degiskeni sifredir*)
                  GOTOxy(1,25);TEXTCOLOR(blue);
                  writeln('K U L L A N I C I  A D I N I Z I  G i R i N i Z . . .');
                  textcolor(green);readln(k);
                  gotoxy(10,13);write('iptal Etmek iáin ESC Tusuna Basabilirsiniz..');
                  textcolor(blue);
                  gotoxy(1,28);
                  writeln('S i F R E N i Z i   G i R i N i Z. . .');
          gir:
          TEXTCOLOR(GREEN);
          i:=0;v:=0;
        repeat
          i:=i+1; v:=v+1;
          tus[i]:=readkey;
          write('*');
          if tus[i]=chr(13) then goto dogrulama;
          if tus[i]=chr(8) then
          begin
             gotoxy(1,28);
             clreol;
             goto gir;
          end;
          if tus[i]=#27 then break;
        until 3=8;
          writeln('islemi iptal ettiniz..');
          DELAY(200);
          GOTO yanlis;
    dogrulama:
    if k=g then
    begin
      if 4<>v-1 then goto yanlis;
      for i:=1 to length(c) do
        begin
        if tus[i]<>c[i] then goto yanlis;
        if i=length(c) then goto dogru;
        end;
    end
    else
yanlis:TEXTCOLOR(RED+BLINK);
SOUND(1500);DELAY(500);
NOSOUND;CLRSCR;GOTOXY(25,25);
WRiteln('G i R i S i N i Z  R E D D E D i L D i');
DELAY(2500);
n:=n+1;
halt;

     dogru: clrscr;
     gotoxy(5,25); TEXTCOLOR(GREEN+128);
     writeln('T E B R i K L E R  G i R i S i N i Z  B A S A R I L I');delay(2000);
end;

             procedure cerceve(x1,y1,x2,y2:byte);
             var
             k:byte;
             begin
             gotoxy(x1,y1);write(#201);
             for k:=x1+1 to x2-1 do write(#205);
             write(#187);
             for k:=y1+1 to y2-1 do
             begin
             gotoxy(x1,k);write(#186);
             gotoxy(x2,k);write(#186);
             end;
             gotoxy(x1,y2);write(#200);
             for k:=x1+1 to x2-1 do write(#205);
             write(#188);
             end;
procedure projekayit;
begin window(5,18,65,40);
assign(dosya,'proje.nzm');
{$I-}reset(dosya);{$I+}
if IOresult<>0 then rewrite(dosya);
  repeat
  clrscr;textcolor(white);highvideo;
  write('Proje Adçnç Giriniz...: ');readln(dos.proad);writeln;
  if dos.proad='' then break;
  write('Proje No"sunu Giriniz...: ');
  {$I-}readln(dos.prono);{$I+}if IOresult>0 then begin
      Textcolor(red);delay(100);sound(500);
      writeln('S A Y I S A L  D E G E R  G i R M E L i S i N ! ! !');
      delay(600);nosound;
      continue;end;writeln;
  Write('Bu Projeyi Hazçrlayacak ôgrenci Sayçsçnç Giriniz...: ');readln(dos.w);writeln;
  b:=0;
            repeat clrscr;
            b:=b+1;writeln(b,'. ô G R E N C i N i N   B i L G i L E R i ....');writeln;
            write('ôgrencinin adç...: ');
            readln(dos.ograd);writeln;
            if dos.ograd='' then break;
            write('ôgrencini No"sunu Giriniz...: ');
            {$I-}readln(dos.ogrno);{$I+}if IOresult>0 then begin
      Textcolor(red);delay(100);sound(500);
      writeln('S A Y I S A L  D E G E R  G i R M E L i S i N ! ! !');
      delay(600);nosound;
      continue;end;writeln;
            write('Bilgiler dosyaya yazçlsçn mç? (E / H)');writeln;
            repeat
            tus:=upcase(readkey);
            until tus in ['E','H'];
            if tus='E' then
            begin
            dos.f:='*';
            seek(dosya,filesize(dosya));
            write(dosya,dos);
            end;
            until b=dos.w;
  until 1=2;
  end;
procedure projeno;
begin
assign(dosya,'proje.nzm');
{$I-}reset(dosya);{$I+}
if IOresult<>0 then rewrite(dosya);
window(10,18,60,42);
      repeat
      clrscr;normvideo;textcolor(14);
      write('Aranacak Projenin No sunu Giriniz....: ');
      {$I-}readln(ara);{$I+}if IOresult>0 then begin
      Textcolor(red);delay(100);sound(500);
      writeln('S A Y I S A L  D E G E R  G i R M E L i S i N ! ! !');
      delay(600);nosound;
      continue;end;
      for i:=0 to filesize(dosya)-1 do
      begin
      seek(dosya,i);
      read(dosya,dos);
      if (dos.prono=ara) and (dos.f='*') then
      begin
      if x=15 then x:=1;normvideo;
      textcolor(x+1);writeln;
      repeat
      x:=x+1;
      writeln('***',x,'.ô G R E N C i N i N   B i L G i L E R i***');writeln;
      writeln('Proje Adç...: ',dos.proad);writeln;
      writeln('ôgrencinin Adç ve Soyadç....: ',dos.ograd);writeln;
      writeln('ôgrencini No su.............: ',dos.ogrno);writeln;
      until 1=1;
      writeln('Diger Kisileri Gîremek ister misiniz...? (E / H)');textcolor(14);
      writeln('************************');
   repeat
   tus:=upcase(readkey);
   until tus in ['E','H'];
   if tus='H' then break;
   end;
   end;
   Writeln;textcolor(red+blink);
   writeln('A R A D I G I N I Z  K A Y I T  B U  K A D A R');x:=0;
   textcolor(13+128);writeln;
   writeln('ÄIKMAK iSTER MiSiNiZ..? ( E / H )');
   repeat
   tus:=upcase(readkey);
   until tus in ['E','H'];
   if tus='E' then  exit;
   until 1=4;
end;
procedure ogrencino;
begin
assign(dosya,'proje.nzm');
{$I-}reset(dosya);{$I+}
if IOresult<>0 then rewrite(dosya);
window(10,18,65,42);
   repeat
      clrscr;normvideo;textcolor(14);
      write('Aranacak ôgrencinin No sunu Giriniz....: ');
      {$I-}readln(ara);{$I+}if IOresult>0 then begin
      Textcolor(red);delay(100);sound(500);
      writeln('S A Y I S A L  D E G E R  G i R M E L i S i N ! ! !');
      delay(600);nosound;
      continue;end;
      for i:=0 to filesize(dosya)-1 do
   begin
      seek(dosya,i);
      read(dosya,dos);
      if (dos.ogrno=ara) and (dos.f='*') then
    begin
       textcolor(9);
       writeln('***ô G R E N C i N i N   B i L G i L E R i***');writeln;
       write('Proje Adç...: ',dos.proad);
       writeln('    Proje No su...: ',dos.prono);writeln;
       writeln('ôgrencinin Adç ve Soyadç....: ',dos.ograd);writeln;
       writeln('ôgrencini No su.............: ',dos.ogrno);writeln;
   end else
    if (dos.ogrno<>ara) and (i=filesize(dosya)-1) then
      begin
      Writeln;textcolor(red+blink);
      writeln('A R A D I G I N I Z  K A Y I T  B U  K A D A R ');
     end;
   end;
   textcolor(13+128);writeln;
    writeln('ÄIKMAK iSTER MiSiNiZ..? ( E / H )');
    repeat
      tus:=upcase(readkey);
     until tus in ['E','H'];
     if tus='E' then  exit;
   until 1=4;
end;
procedure projeara;
begin
clrscr;
assign(dosya,'proje.nzm');
{$I-}reset(dosya);{$I+}
if IOresult<>0 then rewrite(dosya);
textcolor(green);
    cerceve(14,1,66,5);textcolor(red);
    a:='S.D.ö. SENiRKENT MESLEK YöKSEK OKULU';
    c:='V E R i   Y A P I L A R I   V E   P R O G R A M L A M A';
    for i:=1 to length(a) do
       begin
        gotoxy(21+i,3);
        writeln(a[i]);delay(5);
       end;
    textcolor(blue);
    cerceve(8,7,72,11);textcolor(yellow);
    for i:=1 to length(c) do
     begin
      gotoxy(12+i,9);
      writeln(c[i]);delay(5);
     end;
     cerceve(25,18,54,40);
     gotoxy(30,25);textcolor(9);
     writeln('1-Proje No"ya Gîre');
     gotoxy(30,31);
     writeln('2-ôgrenci No"ya Gîre');
     gotoxy(20,42);writeln('Geri dînmek iáin ENTER a basçnçz....');
     gotoxy(30,36);textcolor(12);
     write('***Seáiminiz....: ');
     tus:=readkey;
     textcolor(yellow);
if tus=chr(13) then exit;
case tus of
'1':projeno;
'2':ogrencino;
end;
end;
PROCEDURE proje;
label atla;
begin
assign(dosya,'proje.nzm');
{$I-}reset(dosya);{$I+}
if IOresult<>0 then rewrite(dosya);
window(10,18,60,40);
   repeat
      clrscr;normvideo;textcolor(14);
      write('Silinecek Projenin No sunu Giriniz....: ');
      {$I-}readln(ara);{$I+}if IOresult>0 then begin
      Textcolor(red);delay(100);sound(500);
      writeln('S A Y I S A L  D E G E R  G i R M E L i S i N ! ! !');
      delay(600);nosound;
      continue;end;
          w:=0;
      for i:=0 to filesize(dosya)-1 do
   begin
      seek(dosya,i);
      read(dosya,dos);
     if (dos.prono=ara) and (dos.f='*') then
    begin w:=w+1;
       textcolor(9);writeln;
       writeln('***P R O J E N i N   B i L G i L E R i***');writeln;
       write('Proje Adç...: ',dos.proad);
      writeln('     Proje No su....: ',dos.prono);writeln;
       if w>1 then goto atla;
      writeln('Silinecek Kayit Bu Mu...? (E / H)');
     repeat
      tus:=upcase(readkey);
     until tus in ['E','H'];
     if tus='E' then
    atla:
    begin
     dos.f:='s';
     seek(dosya,i);
     write(dosya,dos);writeln;
     writeln('Kayit Siliniyor.....');delay(500);writeln;
     writeln('Kayçt Silindi.......');
    end;
    end;
    end;
    q:='K A Y I T Y O K T U R  ...';
    textcolor(13+128);writeln;
    writeln('ÄIKMAK iSTER MiSiNiZ..? ( E / H )');
    repeat
     tus:=upcase(readkey);
     until tus in ['E','H'];
     if tus='E' then  exit;
    for i:=1 to length(q) do
    begin
    textcolor(11+128);highvideo;
    write(q[i]);
    delay(100);end;delay(100);
    until 1=2;
    end;
procedure ogrenci;
begin
assign(dosya,'proje.nzm');
{$I-}reset(dosya);{$I+}
if IOresult<>0 then rewrite(dosya);
window(10,18,60,40);
   repeat
      clrscr;normvideo;textcolor(14);
      write('Silinecek ôgrencinin No sunu Giriniz....: ');
      {$I-}readln(ara);{$I+}if IOresult>0 then begin
      Textcolor(red);delay(100);sound(500);
      writeln('S A Y I S A L  D E G E R  G i R M E L i S i N ! ! !');
      delay(600);nosound;
      continue; end;
      for i:=0 to filesize(dosya)-1 do
   begin
      seek(dosya,i);
      read(dosya,dos);
      if (dos.ogrno=ara) and (dos.f='*') then
    begin
       textcolor(9);writeln;
       writeln('***ô G R E N C i N i N   B i L G i L E R i***');writeln;
       writeln('ôgrencinin Adç ve Soyadç....: ',dos.ograd);writeln;
       writeln('ôgrencini No su.............: ',dos.ogrno);writeln;
       writeln('Silinecek Kayit Bu Mu...? (E / H)');
     repeat
      tus:=upcase(readkey);
     until tus in ['E','H'];
     if tus='E' then
    begin
     dos.f:='s';
     seek(dosya,i);
     write(dosya,dos);writeln;
     writeln('Kayit Siliniyor.....');delay(500);writeln;
     writeln('Kayçt Silindi.......');
      end;
    end;
    end;
      q:='K A Y I T Y O K T U R  ...';
      textcolor(13+128);writeln;
    writeln('ÄIKMAK iSTER MiSiNiZ..? ( E / H )');
    repeat
      tus:=upcase(readkey);
     until tus in ['E','H'];
     if tus='E' then  exit;
      for i:=1 to length(q) do
    begin
    textcolor(11+128);highvideo;
    write(q[i]);
    delay(100);end;delay(100);
    until 1=2;
       end;
   procedure t_k_sil;
   VAR r:string;t:integer;label geri;
   begin
   clrscr;window(1,10,80,40);
assign(dosya,'proje.nzm');
writeln('TöM KAYITLAR SILINECEKTIR...?(E/H)');
REPEAT
      tus:=upcase(readkey);
      until tus in ['E','H'];
      if tus='H' then exit;
rewrite(dosya);
r:='<<DOSYANIZDAKi TöM KAYITLAR SiLiNDi>>';
geri: t:=t+1;
for i:=1 to (80-length(r)) do
             begin
             gotoxy(i,t);
             textcolor(i);
             write(r:i);delay(100);clrscr;
      if (i=80-length(r)) then goto geri;
      if keypressed then break;
    end;
end;
          procedure silme;
          begin
          clrscr;
assign(dosya,'proje.nzm');
{$I-}reset(dosya);{$I+}
if IOresult<>0 then rewrite(dosya);
textcolor(green);
    cerceve(14,1,66,5);textcolor(red);
    a:='S.D.ö. SENiRKENT MESLEK YöKSEK OKULU';
    c:='V E R i   Y A P I L A R I   V E   P R O G R A M L A M A';
    for i:=1 to length(a) do
       begin
        gotoxy(21+i,3);
        writeln(a[i]);delay(5);
       end;
    textcolor(blue);
    cerceve(8,7,72,11);textcolor(yellow);
    for i:=1 to length(c) do
     begin
      gotoxy(12+i,9);
      writeln(c[i]);delay(5);
     end;
     cerceve(25,18,54,40);
     gotoxy(26,20);textcolor(13);
     writeln('Silinecek Katgoriyi Seáiniz!');
     gotoxy(35,24);textcolor(9);
     writeln('1-Proje');
     gotoxy(35,28);
     writeln('2-ôgrenci');
     gotoxy(35,32);
     writeln('3-TÅmÅnÅ Sil');
     gotoxy(20,45);writeln('Geri dînmek iáin ENTER a basçnçz....');
     gotoxy(30,36);textcolor(12);
     write('***Seáiminiz....: ');
     tus:=readkey;
     textcolor(yellow);
if tus=chr(13) then exit;
case tus of
'1':proje;
'2':ogrenci;
'3':t_k_sil;
end;
end;
                 procedure dikeycizgi(x1,y1,x2,y2:byte);
                 var k:byte;
                 begin
                for k:=y1+1 to y2-1 do
                   begin
                    gotoxy(x1,k);write(#186);
                    gotoxy(x2,k);write(#186);
                   end;
                 end;
                 procedure yataycizgi(x1,y1,x2,y2:byte);
              var
              k:byte;
                begin
                for k:=x1+1 to x2-1 do write(#205);
              end;
              procedure tablo;
               var t:integer;
              begin
               cerceve(1,1,80,43);
               t:=1;
               for i:=1 to 20 do begin
               t:=t+2;
               gotoxy(2,t);
               yataycizgi(2,t,81,t);
              end;
               dikeycizgi(10,1,10,43);
               dikeycizgi(20,1,20,43);
               dikeycizgi(45,1,45,43);
               dikeycizgi(54,1,54,43);
              end;
                procedure listeleme;
                var j:integer;
                label geri;
                begin clrscr;
assign(dosya,'proje.nzm');
{$I-}reset(dosya);{$I+}
if IOresult<>0 then rewrite(dosya);textcolor(green);
               tablo;
               x:=0; w:=2;  j:=0;
               for i:=0 to filesize(dosya)-1 do
               begin
               seek(dosya,i);
               read(dosya,dos);
               if dos.f='*' then
               begin
               x:=x+1; w:=w+2;   j:=j+1;
               textcolor(12);
               gotoxy(3,2);write('Sira No   ôgr.No     ôgr.Adç ve Soyadç     Proje No       Proje Adç');
               textcolor(11);
               gotoxy(3,w); write(x:3);
               gotoxy(11,w); write(dos.ogrno);
               gotoxy(23,w); write(dos.ograd);
               gotoxy(49,w);write(dos.prono);
               gotoxy(55,w);write(dos.proad);writeln;
               end; GOTOXY(10,45);writeln('Geri dînmek iáin ENTER tusuna basçnçz...');
               if j>19 then
               begin
               gotoxy(10,45);writeln('diger sayfa iáin ENTER tusuna basçnçz...');
               readln;
               w:=2;j:=0;clrscr;textcolor(green);tablo;
               end;
               end;
               readln;
               end;
      procedure yazici;
       var j:integer;
                label geri;
                begin clrscr;
assign(dosya,'proje.nzm');
{$I-}reset(dosya);{$I+}
if IOresult<>0 then rewrite(dosya);
               textcolor(10);
               tablo;
               x:=0; w:=2;  j:=0;  textcolor(red);
               WRiteln('BiLGiLERiNiZ YAZDIRILIYOR..');
               for i:=0 to filesize(dosya)-1 do
               begin
               seek(dosya,i);
               read(dosya,dos);
               if dos.f='*' then
               begin
               x:=x+1; w:=w+2;   j:=j+1;
               textcolor(12);
               gotoxy(3,2);write(lst,'Sira No   ôgr.No     ôgr.Adç ve Soyadç       Proje No      Proje Adç');
               textcolor(11);
               gotoxy(3,w); write(lst,x:3);
               gotoxy(15,w); write(lst,dos.ogrno);
               gotoxy(25,w); write(lst,dos.ograd);
               gotoxy(51,w);write(lst,dos.prono);
               gotoxy(62,w);write(lst,dos.proad);writeln;
               end;
               if j>19 then
               begin
               gotoxy(10,45);writeln(lst,'diger sayfa iáin ENTER tusuna basçnçz...');
               readln;
               w:=2;j:=0;clrscr;textcolor(10);tablo;
               end;
               end;
               readln;
               end;
procedure ogreno;
begin
assign(dosya,'proje.nzm');
                        {$I-} reset(dosya);{$I+}
                        if IOresult<>0 then rewrite(dosya);
window(10,18,60,40);x:=0;w:=0;
repeat
clrscr;textcolor(14);
writeln('DÅzeltilecek ôgrencinin No sunu Giriniz...: ');
{$I-}readln(ara);{$I+}if IOresult>0 then begin
Textcolor(red);delay(100);sound(500);
writeln('S A Y I S A L  DEGERGiRMELiSiN!!!');
delay(600);nosound;
continue;end;
for i:=0 to filesize(dosya)-1 do
 begin
 seek(dosya,i);
 read(dosya,dos);
 if (ara=dos.ogrno) and (dos.f='*') then
 begin textcolor(13);x:=x+1;
 writeln('ôgrencinin Adç ve Soyadç..: ',dos.ograd);writeln;
 writeln('Projesin Adç..: ',dos.proad);writeln;
 writeln('Projesinin No su..: ',dos.prono);writeln;
 textcolor(red);
 writeln('Kayçtta Degisiklik Yapmak istiyor musunuz..? (E/H)');writeln;
 repeat
 tus:=upcase(readkey);
 until tus in['E','H'];
 if tus='E' then
 begin textcolor(7);
 writeln('*** Y E N i  K A Y I T  B i L G i L E R i ***');
 write('Proje Adçnç Giriniz...: ');readln(dos.proad);writeln;
 write('Proje No sunu Giriniz.. :');readln(dos.prono);writeln;
 write('ôgrencinin Adç ve Soyadç...: ');readln(dos.ograd);writeln;
 write('ôgrenci No su..: ');readln(dos.ogrno);writeln;
 seek(dosya,i);
 write(dosya,dos);
 writeln('isleminiz Tamamlançyor...');delay(300);
 writeln('isleminiz Tamamlandç');writeln;
 end;
 end;
 end;
writeln; textcolor(14+128);
writeln('Ardçgçnçz Kayçt Yoktur...');writeln;textcolor(12);
writeln('Äçkmak ister misiniz..? (E/H)');
repeat
tus:=upcase(readkey);
until tus in['E','H'];
if tus='E' then exit;
until 2=3;
end;
procedure prjno;
begin
assign(dosya,'proje.nzm');
                        {$I-} reset(dosya);{$I+}
                        if IOresult<>0 then rewrite(dosya);
window(10,18,60,40);x:=0;w:=0;
repeat
clrscr;textcolor(14);
write('DÅzeltilecek Proje Kayçt No sunu Giriniz...: ');
{$I-}readln(ara);{$I+}if IOresult>0 then
begin
Textcolor(red);delay(100);sound(500);
writeln('SAYISAL DEGER GiRMELiSiN!!!');
delay(1000);nosound;
continue;
end;
              for i:=0 to filesize(dosya)-1 do {projeyi alan îgrenci sayçsçnç belirlemek iáin..}
              begin
                 seek(dosya,i);
                 read(dosya,dos);
                 if (ara=dos.prono) and (dos.f='*') then
                 w:=1+w;
              end;
for i:=0 to filesize(dosya)-1 do
 begin
 seek(dosya,i);
 read(dosya,dos);
 if (ara=dos.prono) and (dos.f='*') then
 begin textcolor(13);x:=x+1;
 writeln('Projenin Adç..: ',dos.proad);writeln; writeln('Projeyi Alan ôgrenci Sayçsç = ',w);writeln;
 writeln('Projeyi Alan ',x,'. ôgrencinin Adç ve Soyadç...: ');writeln;
 writeln(dos.ograd);writeln;
 writeln('Projeyi Alan ôgrenci No su..: ',dos.ogrno);writeln; textcolor(red);
 writeln('Kayçtta Degisiklik Yapmak istiyor musunuz..? (E/H)');writeln;
 repeat
 tus:=upcase(readkey);
 until tus in['E','H'];
 if tus='E' then
 begin textcolor(7);
 write('Yeni Proje Kaydçnçn Adçnç Giriniz...: ');readln(dos.proad);writeln;
 write('Yeni Proje Kaydçnçn No sunu Giriniz.. :');readln(dos.prono);writeln;
 write('Projeyi Alan ôgrencinin Adç ve Soyadç...: ');readln(dos.ograd);writeln;
 write('Projeyi Alan ôgrenci No su..: ');readln(dos.ogrno);writeln;
 seek(dosya,i);
 write(dosya,dos);
 writeln('isleminiz Tamamlançyor...');delay(300);
 writeln('isleminiz Tamamlandç');writeln;
 end;
 end;
 end;
writeln; textcolor(14+128);
writeln('Ardçgçnçz Kayçt Yoktur...');writeln;textcolor(12);
writeln('Äçkmak ister misiniz..? (E/H)');
repeat
tus:=upcase(readkey);
until tus in['E','H'];
if tus='E' then exit;
until 2=3;
 end;
                        procedure duzeltme;
                        begin
                        assign(dosya,'proje.nzm');
                        {$I-} reset(dosya);{$I+}
                        if IOresult<>0 then rewrite(dosya);
                           clrscr;
                           clrscr;textcolor(green);
    cerceve(14,1,66,5);textcolor(red);
    a:='S.D.ö. SENiRKENT MESLEK YöKSEK OKULU';
    c:='V E R i   Y A P I L A R I   V E   P R O G R A M L A M A';
    for i:=1 to length(a) do
       begin
        gotoxy(21+i,3);
        writeln(a[i]);delay(5);
       end;
    textcolor(blue);
    cerceve(8,7,72,11);textcolor(yellow);
    for i:=1 to length(c) do
     begin
      gotoxy(12+i,9);
      writeln(c[i]);delay(5);
     end;
     cerceve(25,18,54,40);
     gotoxy(30,25);textcolor(9);
     writeln('1-Proje No"ya Gîre');
     gotoxy(30,31);
     writeln('2-ôgrenci No"ya Gîre');
     gotoxy(20,42);writeln('Geri dînmek iáin ENTER a basçnçz....');
     gotoxy(30,36);textcolor(12);
     write('***Seáiminiz....: ');
     tus:=readkey;
     textcolor(yellow);
     case tus of
     '1':prjno;
     '2':ogreno;
     end;
end;

procedure kontrol(var sat:byte);
begin
repeat
tus:=readkey;
if tus=#0 then
begin
tus:=readkey;
if tus=#72 then sat:=sat-2; if sat<22 then sat:=34;
if tus=#80 then sat:=sat+2; if sat>34 then sat:=22;
gotoxy(30, sat);
end
else if
(tus='1') or (tus='2')OR (tus='3') OR (tus='4') OR (tus='5') OR (tus='6') OR (tus='7')
then break;
until tus=#13;
end;



begin (*ANA PROGRAMIN BEGiN'i*)
clrscr;
n:=n+1;(*sifre iáin*)
g:=g+1;if g>=2 then goto giris;textcolor(green);
sifre; if n>1 then goto cikis;
yukle;
textbackground(green);
textcolor(red);
gotoxy(19,20);Writeln('P R O J E  T A K i P  P R O G R A M I N A');
gotoxy(29,27);writeln('H O S G E L D i N i Z'); TEXTBACKGROUND(BLACK);
textcolor(red);
gotoxy(20,40);writeln('Devam Etmek iáin Bir Tusa Basçnçz..');
repeat
textcolor(11);
gotoxy(20,35);writeln('bu program NAZIM YILMAZ tarafçndan yazçldç..');
delay(500);
gotoxy(20,35);writeln('BU PROGRAM NAZIM YILMAZ TARAFINDAN YAZILDI..');
DELAY(500);
until Keypressed;
    giris:
    normvideo;
    repeat
    repeat
    window(1,1,80,50);
    clrscr;textcolor(green);
    cerceve(14,1,66,5);textcolor(red);
    a:='S.D.ö. SENiRKENT MESLEK YöKSEK OKULU';
    c:='V E R i   Y A P I L A R I   V E   P R O G R A M L A M A';
      for i:=1 to length(a) do
       begin
        gotoxy(21+i,3);
        writeln(a[i]);delay(10);
       end;
    textcolor(blue);
    cerceve(8,7,72,11);textcolor(yellow);
    for i:=1 to length(c) do
     begin
      gotoxy(12+i,9);
      writeln(c[i]);delay(10);
     end;
    gotoxy(30,22);textcolor(11);
    writeln('1-Proje Kayçt');writeln;
    writeln('2-Proje Ara':40);writeln;
    writeln('3-Proje Sil':40);writeln;
    writeln('4-Proje DÅzeltme':45);writeln;
    writeln('5-Kayçtlarç Listele':48);writeln;
    writeln('6-Kayçtlarç Yazdçr':47);writeln;
    writeln('7-Äçkçs - ESC':42);writeln;writeln;textcolor(10);
    write('***Seáiminiz.....: ':47);textcolor(13);
    cerceve(25,18,54,40);
tus:=readkey;if tus=#27 then goto cikis;
                   if tus=#0 then kontrol(sat);
                   if tus=#13 then begin
                   if sat=22 then projekayit;
                   if sat=24 then projeara;
                   if sat=26 then silme;
                   if sat=28 then duzeltme;
                   if sat=30 then listeleme;
                   if sat=32 then yazici;
                   if sat=34 then goto cikis;
                   end;

until tus<>#7;
case tus of
     '1':projekayit;
     '2':projeara;
     '3':silme;
     '4':duzeltme;
     '5':listeleme;
     '6':yazici;
     '7':cikis:
          begin assign(dosya,'proje.nzm');
          {$I-}reset(dosya);{$I+}
          if IOresult<>0 then rewrite(dosya);clrscr; GOTOXY(20,35);
          textcolor(red);
          writeln('BU PROGRAM NAZIM YILMAZ TARAFINDAN HAZIRLANMISTIR');
          o:='B E N I  S E C T I G I N I Z  I C I N  T E S E K U R L E R !';
          repeat t:=t+1;  Window(1,5,80,30);
          for i:=1 to (80-length(o)) do
             begin
             gotoxy(i,t);
             textcolor(i);
             write(o:i);delay(100);sound(400+i*5);clrscr;
           if keypressed then break;
           end;
           until keypressed;
          close(dosya);nosound;exit;end;
end; {case sec of un end i}
goto giris;
until tus=#7;
end.
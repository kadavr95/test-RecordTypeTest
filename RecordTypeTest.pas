unit RecordTypeTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 type
  TCustomer = record
    name : string[20];
    age  : Integer;
  end;

var
  myFile   : File of TCustomer;  // ���� ������ �������
  customer : TCustomer;

var
  Form2: TForm2;
  scr,i,posi:integer;
  nme:string;

implementation
   type
   mas=array [1..10]of tcustomer;
   var
   M:mas;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);

begin
randomize;
  // ������� ������� �������� ���� Test.cus ��� ������
  AssignFile(myFile, 'Test.cus');
  ReWrite(myFile);
  for i := 1 to 10 do
     begin
         m[i].name:='Player'+inttostr(i);
      m[i].age:=100-i*10;
     end;
   scr:=random(10)*10;
   posi:=0;
   repeat
     posi:=posi+1;
   until scr>=m[posi].age;
   for i := 10 downto posi do
     begin
     m[i].name:=m[i-1].name;
      m[i].age:=m[i-1].age;
     end;
  // ������ ���������� ������� ������� � ����
  m[posi].name :=edit1.text;
  m[posi].age  := scr;
  for i := 1 to 10 do

  Write(myFile, m[i]);



  // �������� �����
  CloseFile(myFile);

  // ��������� �������� ����� � ������ ������ ��� ������
  FileMode := fmOpenRead;
  Reset(myFile);
  i:=1;
  // ����� ����������� �����
 while not Eof(myFile) do

  begin
    Read(myFile, customer);
    ShowMessage(m[i].name+
                     IntToStr(m[i].age));
                     i:=i+1;
  end;

  // �������� ����� � ��������� ���
  CloseFile(myFile);
end;

end.

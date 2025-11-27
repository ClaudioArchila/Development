$PBExportHeader$w_imprimir_talonario.srw
forward
global type w_imprimir_talonario from window
end type
type dw_1 from datawindow within w_imprimir_talonario
end type
end forward

global type w_imprimir_talonario from window
integer x = 5
integer y = 4
integer width = 3634
integer height = 1156
boolean titlebar = true
string title = "Vista Previa"
string menuname = "m_imprimir"
boolean controlmenu = true
long backcolor = 79741120
dw_1 dw_1
end type
global w_imprimir_talonario w_imprimir_talonario

type variables
string s_anio, c_semestre, s_campus, s_cuenta

integer ii_talon_impresion
end variables

forward prototypes
public function string wf_que_mes (integer i_mes)
public function integer wf_cambio_impresora (integer indice_seteo)
end prototypes

public function string wf_que_mes (integer i_mes);string fecha

 CHOOSE CASE i_mes
	CASE 1
		fecha = "enero"
	case 2
		fecha = "febrero"
	case 3
		fecha = "marzo"
	case 4
		fecha = "abril"
	case 5
		fecha = "mayo"
	case 6
		fecha = "junio"
	case 7
		fecha = "julio"
	case 8
		fecha = "agosto"
	case 9
		fecha = "septiembre"
	case 10
		fecha = "octubre"
	case 11
		fecha = "noviembre"
	case 12
		fecha = "diciembre"
END CHOOSE


return fecha
end function

public function integer wf_cambio_impresora (integer indice_seteo);string ls_default, ls_key, ls_driver, ls_port, ls_cambio, ls_printer
long li_rtn 
environment env

IF GetEnvironment(env) <> 1 THEN RETURN 0

CHOOSE CASE env.OSType
//----		
// En caso de ser OS Windows 95/98		
//----
CASE windows!
	//RegistryGet("HKEY_LOCAL_MACHINE\Config\0001\System\CurrentControlSet\Control\Print\Printers", "default", Regstring!, ls_default )
	// Dependiendo del indice de seteo
	// 1 es para formato
	// 2 es para recibo
	CHOOSE CASE indice_seteo
	CASE 1
		// Formato de confirmacion
		RegistrySet("HKEY_LOCAL_MACHINE\Config\0001\System\CurrentControlSet\Control\Print\Printers", "default", Regstring!, "formato" )
		ls_printer = "formato"
	CASE 2
		// Formato de recibos
		RegistrySet("HKEY_LOCAL_MACHINE\Config\0001\System\CurrentControlSet\Control\Print\Printers", "default", Regstring!, "recibo" )
		ls_printer = "recibo"
	END CHOOSE
	// Obtiene el drive printer y el puerto
	ls_key = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Printers\" + ls_printer
	// obtiene el printer driver
	RegistryGet(ls_key, "Printer Driver", ls_driver )
	// obtiene el printer port
	RegistryGet(ls_key, "Port", ls_port)
	// junta toda la información acerca de la impresora
	ls_printer += "," + ls_driver + "," + ls_port
	//Set the new default printer name, driver and port in the WIN.INI file.
	li_rtn = SetProfileString("c:\windows\win.ini", "Windows", "device", ls_printer)
	// RegistryGet("HKEY_LOCAL_MACHINE\Config\0001\System\CurrentControlSet\Control\Print\Printers", "default", Regstring!, ls_default )
//----	
// En caso de ser OS Windows NT
//----
case windowsnt!
	// RegistryGet("HKEY_CURRENT_USER\software\Microsoft\Windows NT\CurrentVersion\Windows", "device", Regstring!, ls_default )
	// Dependiendo del indice de seteo
	// 1 es para formato
	// 2 es para recibo
	CHOOSE CASE indice_seteo
	CASE 1
		// Formato de confirmacion
		RegistrySet("HKEY_CURRENT_USER\software\Microsoft\Windows NT\CurrentVersion\Windows", "Device", Regstring!, "\\IMPRESORA 2\formato,winspool,Ne00:" )
	CASE 2
		// Formato de recibos
		RegistrySet("HKEY_CURRENT_USER\software\Microsoft\Windows NT\CurrentVersion\Windows", "Device", Regstring!, "\\IMPRESORA 1\recibo,winspool,Ne01:" )
	END CHOOSE
	//RegistryGet("HKEY_CURRENT_USER\software\Microsoft\Windows NT\CurrentVersion\Windows", "device", Regstring!, ls_default )
END CHOOSE

return 0
end function

event open;string parametro,talonario_i,talonario_f,no_talonario,anio,semestre,cuenta,nombre,carrera, contrasena, transaccion
string printer
double monto,descuento,beca,pagado,total
long l_pos,row
datetime fecha_pagar

center=true
parametro=message.stringparm
l_pos = pos(parametro,";",1)

talonario_i = left(parametro,l_pos - 1)
talonario_f = mid(parametro,l_pos + 1)

select sum(monto - descuento - beca - pagado)
into :total
from tes_cuentas_x_cobrar
where no_talonario >= :talonario_i and
		no_talonario <= :talonario_f and
		monto - descuento - beca - pagado > 0;

if total=0 then
	messagebox("Error","No existen talonarios con los números indicados o ya han sido cancelados",stopsign!)
	return
end if

declare Talonarios cursor for
	select t.no_talonario,t.anio,t.semestre,t.cuenta,t.monto,t.descuento,t.beca,t.pagado,t.fecha_pagar,a.nombre,a.carrera,t.talon_impreso, tt.descripcion
	from tes_cuentas_x_cobrar t,alumnos a, tes_transacciones tt
	where t.no_talonario >= :talonario_i and
			t.no_talonario <= :talonario_f and
			t.cuenta = a.cuenta and
			t.cod_transaccion = tt.cod_transaccion and
			t.monto - t.descuento - t.beca - t.pagado > 0;
			
open Talonarios;
fetch Talonarios into :no_talonario,:anio,:semestre,:cuenta,:monto,:descuento,:beca,:pagado,:fecha_pagar,:nombre,:carrera,:ii_talon_impresion, :transaccion ;
do while sqlca.sqlcode=0
	select password
	into :contrasena
	from alumnos_otra_info
	where cuenta = :cuenta;
	
	row=dw_1.insertrow(0)
	dw_1.setitem(row,"anio",anio)
	dw_1.setitem(row,"semestre",semestre)
	dw_1.setitem(row,"cuenta",cuenta)
	dw_1.setitem(row,"nombre",nombre)
	dw_1.setitem(row,"carrera",carrera)
	dw_1.setitem(row,"password",contrasena)
	dw_1.setitem(row,"cuota",row)
	dw_1.setitem(row,"monto",monto - descuento - beca - pagado)
	dw_1.setitem(row,"fecha",fecha_pagar)
	dw_1.setitem(row,"no_talonario",no_talonario)
	dw_1.setitem(row,"transaccion", transaccion )
//	if daysafter(date(fecha_pagar),date(2002,12,31)) >= 0 then
//		dw_1.setitem(row,"observacion","VALIDO HASTA EL 31/12/2002")
//	end if
	
	if isnull(ii_talon_impresion) then
		ii_talon_impresion = 1
	else
		ii_talon_impresion = ii_talon_impresion + 1	
	end if 
	
	UPDATE tes_cuentas_x_cobrar  
     SET talon_impreso = :ii_talon_impresion 
   WHERE ( no_talonario = :no_talonario )  and (cuenta = :cuenta) ;
	
	fetch Talonarios into :no_talonario,:anio,:semestre,:cuenta,:monto,:descuento,:beca,:pagado,:fecha_pagar,:nombre,:carrera,:ii_talon_impresion,:transaccion;
loop

close Talonarios;

//select impresora_talon
//into :printer
//from tes_base;
//
//dw_1.object.datawindow.printer = printer
dw_1.print()
close(this)
end event
on w_imprimir_talonario.create
if this.MenuName = "m_imprimir" then this.MenuID = create m_imprimir
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_imprimir_talonario.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_imprimir_talonario
integer y = 24
integer width = 3552
integer height = 900
integer taborder = 10
string dataobject = "d_talonario"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


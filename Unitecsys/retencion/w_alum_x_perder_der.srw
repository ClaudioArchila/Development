$PBExportHeader$w_alum_x_perder_der.srw
forward
global type w_alum_x_perder_der from window
end type
type dw_1 from datawindow within w_alum_x_perder_der
end type
end forward

global type w_alum_x_perder_der from window
integer x = 5
integer y = 4
integer width = 3758
integer height = 2400
boolean titlebar = true
string title = "Vista Previa"
string menuname = "m_pantprint"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
boolean clientedge = true
dw_1 dw_1
end type
global w_alum_x_perder_der w_alum_x_perder_der

on w_alum_x_perder_der.create
if this.MenuName = "m_pantprint" then this.MenuID = create m_pantprint
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_alum_x_perder_der.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
end on

event open;string s_campus, param, s_anio, s_semestre, s_modulo
long l_ini, l_fin

st_parametros str_param
str_param = message.powerobjectparm

select campus 
  into :s_campus 
  from base ;

//param = message.stringparm
//s_anio = left( param, 4 )
//s_semestre = right( param, 1 )

dw_1.settransobject( sqlca )
//dw_1.retrieve( s_campus, s_anio, s_semestre )
dw_1.retrieve( campus_trabajo, str_param.param1, str_param.param2, str_param.param3 )

end event

event activate;this.windowstate = maximized!
end event

event close;w_principal.toolbarvisible=true

end event

type dw_1 from datawindow within w_alum_x_perder_der
integer width = 3643
integer height = 1924
integer taborder = 10
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


#encoding:utf-8
import class_pdf
import sys
from django.db import connection, transaction
from django.conf import settings
from apps.script import delete_Files


def reporte_solicitudes_general(id_inst,tipo,estado,desde,hasta,sexo,grupo,motivo,municipio,ocupacion,tipo_edu,organizacion,sector,dependencia):

        reload(sys)
        sys.setdefaultencoding("utf-8")

        pdf = class_pdf.ReporteCandidato(orientation='L', unit='mm', format='letter')  # HORIENTACION DE LA PAGINA

        pdf.set_author('Marcel Arcuri')
        pdf.alias_nb_pages()  # LLAMADA DE PAGINACION
        pdf.add_page()  # ANADE UNA NUEVA PAGINACION
        pdf.set_margins(15,10,10)  # MARGENE DEL DOCUMENTO
        pdf.set_line_width(0.5)
        pdf.ln(5)
        pdf.set_fill_color(255, 255, 255)
        pdf.set_font('Arial', 'B', 12)
        pdf.cell(250,5,"Listado de Visitas Recibidas".decode("UTF-8"),'',1,'C',1)
        pdf.set_font('Arial', 'B', 10)
        pdf.cell(250,5,"Desde el "+str(desde)+" hasta el "+str(hasta).decode("UTF-8"),'',1,'C',1)
        pdf.set_font('Arial', 'B', 10)
        pdf.ln(5)

        cursor = connection.cursor()
        sql_grupo = "SELECT nom_institucion FROM instituciones_institucion WHERE id=%s "
        cursor.execute(sql_grupo,[id_inst])
        row = dictfetchall(cursor)
        nom_institucion = row[0]['nom_institucion']
        
        pdf.set_fill_color(255, 255, 255)
        pdf.set_font('Arial', 'B', 10)
        pdf.cell(20,5,"Institución: ".decode("UTF-8"),'',0,'L',1)
        pdf.set_font('Arial', '', 10)
        pdf.cell(150,5,nom_institucion.decode("UTF-8"),'',1,'L',1)
        pdf.set_font('Arial', 'B', 10)
        pdf.cell(29,5,"Tipo de reporte:".decode("UTF-8"),'',0,'L',1)
        pdf.set_font('Arial', '', 10)
        if tipo == '1':
                if sexo == '1':
                        genero = 'FEMENINO'
                else:
                        genero = 'MASCULINO '
                tipo_reporte = 'Por Género ('+str(genero)+')'
        elif tipo == '2':
                sql_grupo = "SELECT CONCAT(g.descripcion,' (',g.desde,'-',g.hasta,' Años)') descripcion "
                sql_grupo += "FROM grupo_etareo_grupo_etareo AS g  WHERE g.id=%s  "
                cursor.execute(sql_grupo,[grupo])
                row = dictfetchall(cursor)
                descr = row[0]['descripcion']
                tipo_reporte = 'Por Grupo Etáreo ('+str(descr)+')'
        elif tipo == '3':
                sql_motivo = "SELECT motivo FROM motivo_motivos WHERE id=%s "
                cursor.execute(sql_motivo,[motivo])
                row = dictfetchall(cursor)
                descr = row[0]['motivo']
                tipo_reporte = 'Por Motivo ('+str(descr)+')'
        elif tipo == '4':
                sql_mun = "SELECT municipio FROM municipios_municipio WHERE cod_municipio=%s"
                cursor.execute(sql_mun,[municipio])
                row = dictfetchall(cursor)
                descr = row[0]['municipio']
                tipo_reporte = 'Por Municipio ('+str(descr)+')'
        elif tipo == '5':
                sql_ocupacion = "SELECT ocupacion FROM ocupacion_ocupaciones WHERE id=%s "
                cursor.execute(sql_ocupacion,[ocupacion])
                row = dictfetchall(cursor)
                descr = row[0]['ocupacion']
                tipo_reporte = 'Por Ocupación ('+str(descr)+')'
        elif tipo == '6':
                sql_tipo = "SELECT tipo FROM tipo_educacion_tipoeducacion WHERE id=%s "
                cursor.execute(sql_tipo,[tipo_edu])
                row = dictfetchall(cursor)
                descr = row[0]['tipo']
                tipo_reporte = 'Por Nivel de Educación ('+str(descr)+')'
        elif tipo == '7':
                sql_organizacion = "SELECT organizacion FROM organizacion_social_organizaciones WHERE id=%s "
                cursor.execute(sql_organizacion,[organizacion])
                row = dictfetchall(cursor)
                descr = row[0]['organizacion']
                tipo_reporte = 'Por Organización Social ('+str(descr)+')'
        elif tipo == '8':
                sql_sector = "SELECT sector FROM sector_laboral_sectorlaboral WHERE id=%s "
                cursor.execute(sql_sector,[sector])
                row = dictfetchall(cursor)
                descr = row[0]['sector']
                tipo_reporte = 'Por Sector Laboral ('+str(descr)+')'
        elif tipo == '9':
                sql_dependencia = "SELECT nom_dependencia FROM dependencias_dependencia WHERE id=%s "
                cursor.execute(sql_dependencia,[dependencia])
                row = dictfetchall(cursor)
                descr = row[0]['nom_dependencia']
                tipo_reporte = 'Por Departamento ('+str(descr)+')'
        elif tipo == '10':
                tipo_reporte = 'Total de Visitas'
        elif tipo == '11':
                tipo_reporte = 'Total de Personas'
        elif tipo == '12':
                tipo_reporte = 'Centro de Votación'
        elif tipo == '13':
                tipo_reporte = 'Twitter'
        elif tipo == '14':
                tipo_reporte = 'Total General'
        pdf.cell(150,5,(tipo_reporte).decode("UTF-8"),'',1,'L',1)
        pdf.set_font('Arial', 'B', 10)
        pdf.ln(5)
        
        # Fila de la cabezara de la tabla
        pdf.set_fill_color(0,0,0)
        pdf.set_text_color(255,255,255)
        pdf.set_font('Arial','B',10)
        if tipo == '12':
                pdf.cell(7,5,"#".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(17,5,"Cédula".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(50,5,"Nombre".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(50,5,"Apellido".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(25,5,"Cod Centro".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(100,5,"Centro de Votación".decode("UTF-8"),'LTBR',1,'C',1)
        elif tipo == '13':
                pdf.cell(7,5,"#".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(17,5,"Cédula".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(50,5,"Nombre".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(50,5,"Apellido".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(125,5,"Twitter".decode("UTF-8"),'LTBR',1,'C',1)
        elif tipo == '14':
                pdf.cell(15,5,"Cédula".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(60,5,"Nombre y Apellido".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(50,5,"Motivo".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(15,5,"Fecha".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(50,5,"Municipio".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(60,5,"Organización".decode("UTF-8"),'LTBR',0,'C',1)
        else:
                pdf.cell(7,5,"#".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(15,5,"Código".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(17,5,"Cédula".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(50,5,"Nombre".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(50,5,"Apellido".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(20,5,"Fecha".decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(90,5,"Departamento".decode("UTF-8"),'LTBR',1,'C',1)
        
        pdf.set_fill_color(255,255,255)
        pdf.set_font('Arial','',10)
        # print tipo
        cursor = connection.cursor()
        if tipo == '11':
                sql_sop = "  SELECT DISTINCT ON (s.cedula) s.codigo, s.cedula, s.nombre, s.apellido, CAST(s.fecha_ent AS date) dia_ent, CAST(s.fecha_ent AS time) hora_ent, "
        elif tipo == '12':
                sql_sop = "  SELECT DISTINCT ON (s.cedula) s.cedula, s.nombre, s.apellido, s.codigo_centro, s.nombre_centro, "
        elif tipo == '13':
                # print "entro"
                sql_sop = "  SELECT DISTINCT ON (s.cedula) s.codigo, s.cedula, s.nombre, s.apellido, s.twitter, "
        elif tipo == '14':
                # print "entro"
                sql_sop = "  SELECT s.cedula, s.nombre, s.apellido, "
                sql_sop += "  (SELECT motivo FROM motivo_motivos WHERE id=s.motivo_id) motivo, CAST(s.fecha_ent AS date) fecha, "
                sql_sop += "  (SELECT municipio FROM municipios_municipio WHERE cod_municipio=s.municipio) municipio, "
                sql_sop += "  (SELECT organizacion FROM organizacion_social_organizaciones WHERE id=s.organizacion_id) organizacion"
                sql_sop += " FROM solicitud_registros s "
                
        else:
                sql_sop = "  SELECT s.codigo, s.cedula, s.nombre, s.apellido, CAST(s.fecha_ent AS date) dia_ent, CAST(s.fecha_ent AS time) hora_ent, "
                sql_sop += "  CAST(s.fecha_sal AS date) dia_sal, CAST(s.fecha_sal AS time) hora_sal, d.nom_dependencia "
                sql_sop += " FROM solicitud_registros s "
                sql_sop += " INNER JOIN dependencias_dependencia d ON s.departamento_id = d.id"
        
        if tipo == '1':
                sql_sop += " WHERE s.institucion_id=%s and s.sexo=%s and s.fecha_ent::date between %s and %s "
                sql_sop += " ORDER BY s.codigo ASC "
                cursor.execute(sql_sop,[id_inst,sexo,desde,hasta])
        elif tipo == '2':
                sql_grupo = "SELECT desde, hasta FROM grupo_etareo_grupo_etareo WHERE id=%s "
                cursor.execute(sql_grupo,[grupo])
                row = dictfetchall(cursor)
                desde_e = row[0]['desde']
                hasta_e = row[0]['hasta']
                sql_sop += " WHERE s.institucion_id=%s and s.edad between %s and %s and s.fecha_ent::date between %s and %s "
                sql_sop += " ORDER BY s.codigo ASC "
                cursor.execute(sql_sop,[id_inst,desde_e,hasta_e,desde,hasta])
        elif tipo == '3':
                sql_sop += " WHERE s.institucion_id=%s and s.motivo_id=%s and s.fecha_ent::date between %s and %s "
                sql_sop += " ORDER BY s.codigo ASC "
                cursor.execute(sql_sop,[id_inst,motivo,desde,hasta])
        elif tipo == '4':
                sql_sop += " WHERE s.institucion_id=%s and s.estado_id=%s and s.municipio=%s and s.fecha_ent::date between %s and %s "
                sql_sop += " ORDER BY s.codigo ASC "
                cursor.execute(sql_sop,[id_inst,estado,municipio,desde,hasta])
        elif tipo == '5':
                sql_sop += " WHERE s.institucion_id=%s and s.ocupacion_id=%s and s.fecha_ent::date between %s and %s "
                sql_sop += " ORDER BY s.codigo ASC "
                cursor.execute(sql_sop,[id_inst,ocupacion,desde,hasta])
        elif tipo == '6':
                sql_sop += " WHERE s.institucion_id=%s and s.tipo_edu_id=%s and s.fecha_ent::date between %s and %s "
                sql_sop += " ORDER BY s.codigo ASC "
                cursor.execute(sql_sop,[id_inst,tipo_edu,desde,hasta])
        elif tipo == '7':
                sql_sop += " WHERE s.institucion_id=%s and s.organizacion_id=%s and s.fecha_ent::date between %s and %s "
                sql_sop += " ORDER BY s.codigo ASC "
                cursor.execute(sql_sop,[id_inst,organizacion,desde,hasta])
        elif tipo == '8':
                sql_sop += " WHERE s.institucion_id=%s and s.sector_lab_id=%s and s.fecha_ent::date between %s and %s "
                sql_sop += " ORDER BY s.codigo ASC "
                cursor.execute(sql_sop,[id_inst,sector,desde,hasta])
        elif tipo == '9':
                sql_sop += " WHERE s.institucion_id=%s and s.departamento_id=%s and s.fecha_ent::date between %s and %s "
                sql_sop += " ORDER BY s.codigo ASC "
                cursor.execute(sql_sop,[id_inst,dependencia,desde,hasta])
        elif tipo == '10':
                sql_sop += " WHERE s.institucion_id=%s and s.fecha_ent::date between %s and %s "
                sql_sop += " ORDER BY s.codigo ASC "
                cursor.execute(sql_sop,[id_inst,desde,hasta])
        elif tipo == '14':
                sql_sop += " WHERE s.institucion_id=%s and s.fecha_ent::date between %s and %s "
                sql_sop += " ORDER BY s.codigo ASC "
                cursor.execute(sql_sop,[id_inst,desde,hasta])
        else:
                sql_sop += " WHERE s.institucion_id=%s and s.fecha_ent::date between %s and %s "
                cursor.execute(sql_sop,[id_inst,desde,hasta])
        print sql_sop
        row = dictfetchall(cursor)
        
        i = 1
        j = 0
        item = 0
        o = 0
        h = 0
        for t in row:
                # id_c = t['id_c']
                if tipo == '12':
                        if t['nombre_centro'] == None:
                                centro = ''
                        else:
                                centro = t['nombre_centro']
                        l =  len(centro) #Cuenta el numero de letras que viene en la cadena
                        p = 1 + (l/70) #Numero de lineas que ocupara la descripcion del bien
                elif tipo == '13':
                        p = 1
                elif tipo == '14':
                        # nom = str(t['organizacion'])+''+str(t['organizacion'])
                        l =  len(t['organizacion']) #Cuenta el numero de letras que viene en la cadena
                        p = 1 + (l/40) #Numero de lineas que ocupara la descripcion del bien
                        # l =  len(nom) #Cuenta el numero de letras que viene en la cadena
                        # l2 =  len(t['organizacion']) #Cuenta el numero de letras que viene en la cadena
                        # if l > l2:
                        #         p = 1 + (l/60) #Numero de lineas que ocupara la descripcion del bien
                        # else:
                        #         p = 1 + (l2/40) #Numero de lineas que ocupara la descripcion del bien
                else:
                        l =  len(t['nom_dependencia']) #Cuenta el numero de letras que viene en la cadena
                        p = 1 + (l/50) #Numero de lineas que ocupara la descripcion del bien
                h = h + (5 * p) #Numero de lineas que arman la data del pdf
                print h

                #### Validacion en base a  P para el grosor de la celdas
                if p == 1:
                    a = 5
                elif p == 2:
                    a = 10
                    
                pdf.set_fill_color(255,255,255)
                if h >= 110:
                        pdf.add_page()
                        pdf.ln(5)
                        pdf.set_fill_color(255, 255, 255)
                        pdf.set_font('Arial', 'B', 12)
                        pdf.cell(250,5,"Listado de Visitas Recibidas".decode("UTF-8"),'',1,'C',1)
                        pdf.set_font('Arial', 'B', 10)
                        pdf.cell(250,5,"Desde el "+str(desde)+" hasta el "+str(hasta).decode("UTF-8"),'',1,'C',1)
                        pdf.set_font('Arial', 'B', 10)
                        pdf.set_fill_color(255,255,255)
                        pdf.ln(5)
                        pdf.set_fill_color(255, 255, 255)
                        pdf.set_font('Arial', 'B', 10)
                        pdf.cell(20,5,"Institución: ".decode("UTF-8"),'',0,'L',1)
                        pdf.set_font('Arial', '', 10)
                        pdf.cell(150,5,nom_institucion.decode("UTF-8"),'',1,'L',1)
                        pdf.set_font('Arial', 'B', 10)
                        pdf.cell(29,5,"Tipo de reporte:".decode("UTF-8"),'',0,'L',1)
                        pdf.set_font('Arial', '', 10)
                        pdf.cell(150,5,(tipo_reporte).decode("UTF-8"),'',1,'L',1)
                        pdf.set_font('Arial', 'B', 10)
                        pdf.ln(5)

                        # Fila de la cabezara de la tabla
                        if tipo == '12':
                                pdf.set_fill_color(0,0,0)
                                pdf.set_text_color(255,255,255)
                                pdf.set_font('Arial','B',10)
                                pdf.cell(7,5,"#".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(17,5,"Cédula".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(50,5,"Nombre".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(50,5,"Apellido".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(25,5,"Cod Centro".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(100,5,"Centro de Votación".decode("UTF-8"),'LTBR',1,'C',1)
                                pdf.set_fill_color(255,255,255)
                                pdf.set_font('Arial','',10)
                                j=0
                                o=0
                                h=0
                        elif tipo == '13':
                                pdf.set_fill_color(0,0,0)
                                pdf.set_text_color(255,255,255)
                                pdf.set_font('Arial','B',10)
                                pdf.cell(7,5,"#".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(17,5,"Cédula".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(50,5,"Nombre".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(50,5,"Apellido".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(125,5,"Twitter".decode("UTF-8"),'LTBR',1,'C',1)
                                pdf.set_fill_color(255,255,255)
                                pdf.set_font('Arial','',10)
                                j=0
                                o=0
                                h=0
                        elif tipo == '14':
                                pdf.set_fill_color(0,0,0)
                                pdf.set_text_color(255,255,255)
                                pdf.set_font('Arial','B',10)
                                pdf.cell(15,5,"Cédula".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(60,5,"Nombre y Apellido".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(50,5,"Motivo".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(15,5,"Fecha".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(50,5,"Municipio".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(60,5,"Organización".decode("UTF-8"),'LTBR',0,'C',1)
                                j=0
                                o=0
                                h=0
                        else:
                                pdf.set_fill_color(0,0,0)
                                pdf.set_text_color(255,255,255)
                                pdf.set_font('Arial','B',10)
                                pdf.cell(7,5,"#".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(17,5,"Cédula".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(50,5,"Nombre".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(50,5,"Apellido".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(20,5,"Fecha".decode("UTF-8"),'LTBR',0,'C',1)
                                pdf.cell(90,5,"Departamento".decode("UTF-8"),'LTBR',1,'C',1)
                                pdf.set_fill_color(255,255,255)
                                pdf.set_font('Arial','',10)
                                # Fin Cabezera
                                j=0
                                o=0
                                h=0
                item = int(item) + 1
                # print tipo
                if tipo == '12':
                        if t['codigo_centro'] is None:
                                codigo_c = ''
                        else:
                                codigo_c = t['codigo_centro']
                        if t['nombre_centro'] is None:
                                nombre_c = ''
                        else:
                                nombre_c = t['nombre_centro'] 
                        pdf.set_font('Arial','',8)
                        pdf.set_fill_color(255,255,255)
                        pdf.set_text_color(24,29,31)
                        pdf.set_y(75+o)
                        pdf.set_x(15)
                        pdf.cell(7,a,str(item).decode("UTF-8"),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(22)
                        pdf.cell(17,a,str(t['cedula']),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(39)
                        pdf.cell(50,a,str(t['nombre']).decode("UTF-8"),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(89)
                        pdf.cell(50,a,str(t['apellido']).decode("UTF-8"),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(139)
                        pdf.cell(25,a,str(codigo_c),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(164)
                        pdf.multi_cell(100,5,str(nombre_c).decode("UTF-8"),'LTBR','C',1)
                        j = j + 1
                        ### VAlidacion de la ubicacion (altura J) de los registros en base a la cantidad de lineas de las descripcion 
                        if p == 1:
                           o = o + 5 
                        elif p == 2:
                            o = o + 10
                elif tipo == '13':
                        dia_e = ''
                        pdf.set_font('Arial','',8)
                        pdf.set_fill_color(255,255,255)
                        pdf.set_text_color(24,29,31)
                        pdf.set_y(75+o)
                        pdf.set_x(15)
                        pdf.cell(7,a,str(item).decode("UTF-8"),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(22)
                        pdf.cell(17,a,str(t['cedula']),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(39)
                        pdf.cell(50,a,str(t['nombre']).decode("UTF-8"),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(89)
                        pdf.cell(50,a,str(t['apellido']).decode("UTF-8"),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(139)
                        pdf.cell(125,a,str(t['twitter']).decode("UTF-8"),'LTBR',1,'L',1)
                        j = j + 1
                        ### VAlidacion de la ubicacion (altura J) de los registros en base a la cantidad de lineas de las descripcion 
                        if p == 1:
                           o = o + 5 
                        elif p == 2:
                            o = o + 10
                elif tipo == '14':
                        dia_e = str(t['fecha']).split('-')
                        fecha = dia_e[2]+'-'+dia_e[1]+'-'+dia_e[0]
                        pdf.set_font('Arial','',6.5)
                        pdf.set_fill_color(255,255,255)
                        pdf.set_text_color(24,29,31)
                        pdf.set_y(75+o)
                        pdf.set_x(15)
                        pdf.cell(15,a,str(t['cedula']),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(30)
                        pdf.multi_cell(60,a,str(t['nombre'])+' '+str(t['apellido']).decode("UTF-8"),'LTBR','J',1)
                        pdf.set_y(75+o)
                        pdf.set_x(90)
                        pdf.cell(50,a,str(t['motivo']).decode("UTF-8"),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(140)
                        pdf.cell(15,a,str(t['fecha']).decode("UTF-8"),'LTBR',1,'L',1)
                        pdf.set_y(75+o)
                        pdf.set_x(155)
                        pdf.cell(50,a,str(t['municipio']).decode("UTF-8"),'LTBR',1,'L',1)
                        pdf.set_y(75+o)
                        pdf.set_x(205)
                        pdf.multi_cell(60,5,str(t['organizacion']).decode("UTF-8"),'LTBR','J',1)
                        
                        j = j + 1
                        ### VAlidacion de la ubicacion (altura J) de los registros en base a la cantidad de lineas de las descripcion 
                        if p == 1:
                                o = o + 5 
                        elif p == 2:
                                o = o + 10
                else:
                        dia_e = str(t['dia_ent']).split('-')
                        dia_e = dia_e[2]+'-'+dia_e[1]+'-'+dia_e[0]
                        
                        pdf.set_font('Arial','',8)
                        pdf.set_fill_color(255,255,255)
                        pdf.set_text_color(24,29,31)
                        pdf.set_y(75+o)
                        pdf.set_x(15)
                        pdf.cell(7,a,str(item).decode("UTF-8"),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(22)
                        pdf.cell(15,a,str(t['codigo']),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(37)
                        pdf.cell(17,a,str(t['cedula']),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(54)
                        pdf.cell(50,a,str(t['nombre']).decode("UTF-8"),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(104)
                        pdf.cell(50,a,str(t['apellido']).decode("UTF-8"),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(154)
                        pdf.cell(20,a,str(dia_e),'LTBR',0,'C',1)
                        pdf.set_y(75+o)
                        pdf.set_x(174)
                        pdf.multi_cell(90,5,str(t['nom_dependencia']).decode("UTF-8"),'LTBR','C',1)
                        j = j + 1
                        ### VAlidacion de la ubicacion (altura J) de los registros en base a la cantidad de lineas de las descripcion 
                        if p == 1:
                           o = o + 5 
                        elif p == 2:
                            o = o + 10

                

                
        ruta_reporte = settings.MEDIA_PDF
        nombre = ' Detallado.pdf'
        pdf.output(ruta_reporte+'/'+nombre, 'F')
        archivo = open(ruta_reporte+'/'+nombre, "r")

        ruta = ruta_reporte+'/'
        delete_Files(ruta)
        
        return nombre, archivo


def dictfetchall(cursor):
    "Returns all rows from a cursor as a dict"
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]

#encoding:utf-8
import class_pdf
import sys
from django.db import connection, transaction
from django.conf import settings
from apps.script import delete_Files


def reporte_ficha_personal(cedula, desde, hasta, id_inst, tipo):

        reload(sys)
        sys.setdefaultencoding("utf-8")

        pdf = class_pdf.ReporteFicha(orientation='P', unit='mm', format='letter')  # HORIENTACION DE LA PAGINA

        pdf.set_author('Marcel Arcuri')
        pdf.alias_nb_pages()  # LLAMADA DE PAGINACION
        pdf.add_page()  # ANADE UNA NUEVA PAGINACION
        pdf.set_margins(15,10,10)  # MARGENE DEL DOCUMENTO
        pdf.set_line_width(0.5)
        pdf.ln(5)
        cedula = cedula
        # print cedula
        cursor = connection.cursor()
        sql_usuario = "SELECT s.nombre, s.apellido, s.sexo, s.edad, s.telefono, s.twitter, s.codigo_centro, s.nombre_centro, "
        sql_usuario += "(SELECT estado FROM estados_estado WHERE id=s.estado_id) estado, "
        sql_usuario += "(SELECT municipio FROM municipios_municipio WHERE cod_municipio=s.municipio) municipio, "
        sql_usuario += "(SELECT parroquia FROM parroquias_parroquia WHERE cod_parroquia=s.parroquia) parroquia, "
        sql_usuario += "(SELECT tipo FROM tipo_educacion_tipoeducacion WHERE id=s.tipo_edu_id) tipo_edu, "
        sql_usuario += "(SELECT ocupacion FROM ocupacion_ocupaciones WHERE id=s.ocupacion_id) ocupacion, "
        sql_usuario += "(SELECT organizacion FROM organizacion_social_organizaciones WHERE id=s.organizacion_id) organizacion, "
        sql_usuario += "(SELECT sector FROM sector_laboral_sectorlaboral WHERE id=s.sector_lab_id) sector "
        sql_usuario += "FROM solicitud_registros AS s "
        sql_usuario += "WHERE cedula = %s  ORDER BY s.id DESC LIMIT 1"
        cursor.execute(sql_usuario,[cedula])
        row = dictfetchall(cursor)

        nombre = row[0]['nombre']
        apellido = row[0]['apellido']
        sexo = row[0]['sexo']
        if sexo == '1':
                sex = 'FEMENINO'
        elif sexo == '2':
                sex = 'MASCULINO'
        edad = row[0]['edad']
        telefono = row[0]['telefono']
        twitter = row[0]['twitter']
        if twitter == '':
                twit = 'NO TIENE'
        else:
                twit = twitter
        codigo_centro = row[0]['codigo_centro']
        if codigo_centro is None:
                centro = 'N/A'
        else:
                centro = str(codigo_centro)+' - '+str(row[0]['nombre_centro'])

        estado = row[0]['estado']
        municipio = row[0]['municipio']
        parroquia = row[0]['parroquia']
        tipo_edu = row[0]['tipo_edu']
        ocupacion = row[0]['ocupacion']
        organizacion = row[0]['organizacion']
        sector = row[0]['sector']

        pdf.set_fill_color(255,255,255)
        pdf.set_font('Arial','B',14)
        pdf.cell(185,7,"FICHA PERSONAL".decode("UTF-8"),'LTBR',1,'C',1)
        pdf.set_fill_color(171,171,171)
        pdf.set_text_color(0,0,0)
        pdf.set_font('Arial','B',10)
        pdf.cell(185,5,"DATOS PERSONALES".decode("UTF-8"),'LTBR',1,'C',1)
        pdf.set_fill_color(255,255,255)
        pdf.set_text_color(24,29,31)
        
        cursor = connection.cursor()
        sql_tot_v = "SELECT count(cedula) total FROM solicitud_registros WHERE cedula = %s "
        cursor.execute(sql_tot_v,[cedula])
        row = dictfetchall(cursor)
        total = row[0]['total']
        if tipo == '1':
                cursor = connection.cursor()
                sql_inst = "SELECT nom_institucion FROM instituciones_institucion WHERE id=%s "
                cursor.execute(sql_inst,[id_inst])
                row3 = dictfetchall(cursor)
                nom_institucion = row3[0]['nom_institucion']
        
        
        
        pdf.set_font('Arial','B',9)
        pdf.cell(16,5,"CÉDULA:".decode("UTF-8"),'LT',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(20,5,str(cedula).decode("UTF-8"),'T',0,'L',1)
        pdf.set_font('Arial','B',9)
        pdf.cell(38,5,"/ NOMBRE Y APELLIDO:".decode("UTF-8"),'T',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(111,5,str(nombre)+' '+str(apellido).decode("UTF-8"),'TR',1,'L',1)
        
        pdf.set_font('Arial','B',9)
        pdf.cell(12,5,"SEXO:".decode("UTF-8"),'L',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(70,5,str(sex).decode("UTF-8"),'',0,'',1)
        pdf.set_font('Arial','B',9)
        pdf.cell(28,5,"/ TOTAL VISITAS:".decode("UTF-8"),'',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(75,5,str(total).decode("UTF-8"),'R',1,'L',1)

        
       
        pdf.set_font('Arial','B',9)
        pdf.cell(20,5,"TELÉFONO:".decode("UTF-8"),'L',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(25,5,str(telefono).decode("UTF-8"),'',0,'L',1)
        pdf.set_font('Arial','B',9)
        pdf.cell(14,5,"/ EDAD:".decode("UTF-8"),'',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(23,5,str(edad)+' AÑOS'.decode("UTF-8"),'',0,'L',1)
        pdf.set_font('Arial','B',9)
        pdf.cell(18,5,"/ TWITTER:".decode("UTF-8"),'',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(85,5,str(twit).decode("UTF-8"),'R',1,'',1)
        
        if tipo == '1':
                pdf.set_font('Arial','B',9)
                pdf.cell(39,5,"CENTRO DE VOTACIÓN:".decode("UTF-8"),'L',0,'L',1)
                pdf.set_font('Arial','',9)
                pdf.cell(146,5,str(centro).decode("UTF-8"),'R',1,'L',1)
                pdf.set_font('Arial','B',9)
                pdf.cell(25,5,"INSTITUCIÓN:".decode("UTF-8"),'L',0,'L',1)
                pdf.set_font('Arial','',9)
                pdf.cell(160,5,str(nom_institucion).decode("UTF-8"),'R',1,'L',1)
                pdf.set_font('Arial','B',9)
                pdf.cell(18,5,"PERÍODO:".decode("UTF-8"),'LB',0,'L',1)
                pdf.set_font('Arial','',9)
                pdf.cell(167,5,"DESDE EL "+str(desde)+" HASTA EL "+str(hasta).decode("UTF-8"),'BR',1,'L',1)
        else:
                pdf.set_font('Arial','B',9)
                pdf.cell(39,5,"CENTRO DE VOTACIÓN:".decode("UTF-8"),'LB',0,'L',1)
                pdf.set_font('Arial','',9)
                pdf.cell(146,5,str(centro).decode("UTF-8"),'BR',1,'L',1)
        
        pdf.set_fill_color(236,236,236)
        pdf.set_text_color(24,29,31)
        pdf.set_font('Arial','B',10)
        pdf.cell(185,5,"DIRECCIÓN".decode("UTF-8"),'LTBR',1,'C',1)
        pdf.set_fill_color(255,255,255)
        pdf.set_text_color(24,29,31)
        pdf.set_font('Arial','B',9)
        pdf.set_font('Arial','B',9)
        pdf.cell(16,5,"ESTADO:".decode("UTF-8"),'LT',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(169,5,str(estado).decode("UTF-8"),'TR',1,'L',1)
        pdf.set_font('Arial','B',9)
        pdf.cell(19,5,"MUNICIPIO:".decode("UTF-8"),'L',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(166,5,str(municipio).decode("UTF-8"),'R',1,'L',1)
        pdf.set_font('Arial','B',9)
        pdf.cell(22,5,"PARROQUIA:".decode("UTF-8"),'LB',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(163,5,str(parroquia).decode("UTF-8"),'RB',1,'L',1)
        
        
        pdf.set_fill_color(171,171,171)
        pdf.set_text_color(0,0,0)
        pdf.set_font('Arial','B',10)
        pdf.cell(185,5,"INFORMACIÓN PROFESIONAL".decode("UTF-8"),'LTBR',1,'C',1)
        pdf.set_fill_color(255,255,255)
        pdf.set_text_color(24,29,31)
        
        pdf.set_font('Arial','B',9)
        pdf.set_font('Arial','B',9)
        pdf.cell(22,5,"EDUCACIÓN:".decode("UTF-8"),'LT',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(163,5,str(tipo_edu).decode("UTF-8"),'TR',1,'L',1)

        pdf.set_font('Arial','B',9)
        pdf.cell(22,5,"OCUPACIÓN:".decode("UTF-8"),'L',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(163,5,str(ocupacion).decode("UTF-8"),'R',1,'L',1)
       
        pdf.set_font('Arial','B',9)
        pdf.cell(28,5,"ORGANIZACIÓN:".decode("UTF-8"),'L',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(157,5,str(organizacion).decode("UTF-8"),'R',1,'L',1)
        pdf.set_font('Arial','B',9)
        pdf.cell(16,5,"SECTOR:".decode("UTF-8"),'LB',0,'L',1)
        pdf.set_font('Arial','',9)
        pdf.cell(169,5,str(sector).decode("UTF-8"),'BR',1,'L',1)
        
        pdf.ln(5)
        pdf.set_fill_color(171,171,171)
        pdf.set_text_color(0,0,0)
        pdf.set_font('Arial','B',9)
        pdf.cell(185,5,"VISITAS REALIZADAS".decode("UTF-8"),'LTBR',1,'C',1)
        pdf.set_fill_color(236,236,236)
        pdf.set_text_color(24,29,31)
        pdf.cell(5,5,"#".decode("UTF-8"),'LTBR',0,'C',1)
        pdf.cell(15,5,"FECHA".decode("UTF-8"),'LTBR',0,'C',1)
        pdf.cell(95,5,"DEPARTAMENTO".decode("UTF-8"),'LTBR',0,'C',1)
        pdf.cell(70,5,"MOTIVO".decode("UTF-8"),'LTBR',1,'C',1)
        pdf.set_fill_color(255,255,255)
        pdf.set_text_color(24,29,31)
        
        cursor = connection.cursor()
        sql_visitas = "SELECT date(s.fecha_ent) fecha, "
        sql_visitas += "(SELECT nom_dependencia FROM dependencias_dependencia WHERE id=s.departamento_id) departamento, "
        sql_visitas += "(SELECT motivo FROM motivo_motivos WHERE id=s.motivo_id) motivo "
        sql_visitas += "FROM solicitud_registros AS s "
        sql_visitas += "WHERE cedula = %s  ORDER BY s.id ASC "
        cursor.execute(sql_visitas,[cedula])
        row2 = dictfetchall(cursor)
        item = 1
        for i in row2:
                fec = str(i['fecha']).split('-')
                fecha = fec[2]+'-'+fec[1]+'-'+fec[0]
                departamento = i['departamento']
                motivo = i['motivo']
                # print fecha
                pdf.set_font('Arial','',7)
                pdf.cell(5,5,str(item).decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(15,5,str(fecha).decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(95,5,str(departamento).decode("UTF-8"),'LTBR',0,'C',1)
                pdf.cell(70,5,str(motivo).decode("UTF-8"),'LTBR',1,'C',1) 
                # 
                item = item + 1

        ruta_reporte = settings.MEDIA_PDF
        nombre = ' Ficha Personal.pdf'
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

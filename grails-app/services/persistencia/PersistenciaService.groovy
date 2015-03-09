package persistencia

import excepciones.ExcepcionYaExisteElUsuario
import grails.transaction.Transactional
import regalo.Regalo
import usuario.Usuario

@Transactional
class PersistenciaService {

	def persistir(Usuario unUsuario){
		Usuario unaPersona=null
		unaPersona= Usuario.findByDni(unUsuario.dni)
		if (unaPersona != null)
			throw new ExcepcionYaExisteElUsuario("Ese usuario ya existe");
		else
			unUsuario.save(flush:true)
	}

	def obtenerUsuarioPorID(int id){
		Usuario unaPersona = Usuario.get(id)
	}

	def guardarModificado(Usuario unUsuario){
		unUsuario.save(flush:true)
	}

	def obtenerRegalosHoy(){
		def regalos= Regalo.findAllByFechaRegaladoAndRegalado(new Date().clearTime(),false)
	}

	def obtenerRegaloPorID(int id){
		Regalo unRegalo = Regalo.get(id)
	}

	def obtenerRegalosDelMes(){
		def fecha=new Date()
		def regalos=Regalo.getAll().findAll{it.fechaRegalado.getYear()==fecha.getYear()&&it.fechaRegalado.getMonth()==fecha.getMonth()}
	}
}
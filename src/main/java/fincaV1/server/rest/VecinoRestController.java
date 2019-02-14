package fincaV1.server.rest;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Response;

import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import fincaV1.server.entity.VecinoBean;
import fincaV1.server.entity.ResponseBean;
import fincaV1.server.servicegeneric.GenericServiceImp;
import fincaV1.server.validator.CheckForeignKey;
import fincaV1.server.validator.CheckPermission;
import fincaV1.server.validator.EditProfileValidators;
import fincaV1.server.validator.SpecificValidators;

@RestController
public class VecinoRestController {

	@Autowired
	private GenericServiceImp genericService;
	@Autowired 
	private CheckForeignKey checkForeignKey;
	@Autowired
	SpecificValidators specificValidator;
	@Autowired
	CheckPermission check;
	@Autowired
	EditProfileValidators editProfileValidator;
	
	@PreAuthorize("ADMIN")
	@RequestMapping(value="/vecinos", method=RequestMethod.GET)
	public List<VecinoBean> vecinos() {
		check.checkPermissions(1);
		return (List<VecinoBean>) genericService.getAll(VecinoBean.class);
	}
	
	@RequestMapping(value="/vecinos/{id}", method=RequestMethod.GET)
	public VecinoBean vecino(@PathVariable int id) {
		check.checkPermissions(1);
		return (VecinoBean) genericService.get(VecinoBean.class, id);
	}
	
	@RequestMapping(value="/vecinos/{id}", method=RequestMethod.DELETE)
	public ResponseBean vecinodelete(@PathVariable int id) {
		check.checkPermissions(1);
		return new ResponseBean(200, genericService.delete(genericService.get(VecinoBean.class, id)));
	}
	
	@Before("execution(* fincaV1.server.before.BeforeBody*.checkBody*()")
	@RequestMapping(value="/vecinos", method=RequestMethod.POST)
	public<T> ResponseBean vecinosave(@RequestBody VecinoBean vecino) {
		check.checkPermissions(1);
		HashMap<T, Integer> datos = new HashMap<T, Integer>();
		datos.put((T) vecino.getComunidad(),vecino.getComunidad().getId());
		datos.put((T) vecino.getId_tipovecino() ,vecino.getId_tipovecino().getId());
		datos.put((T) vecino.getPoblacion(),vecino.getPoblacion().getId());
		checkForeignKey.checkForeignKey(datos);
		return new ResponseBean(200, "Registro creado con id: " + genericService.save(vecino));
	}
	
	@RequestMapping(value="/vecinos", method=RequestMethod.PUT)
	public<T> ResponseBean vecinoupdate(@RequestBody VecinoBean vecino) {
		check.checkPermissions(1);
		HashMap<T, Integer> datos = new HashMap<T, Integer>();
		datos.put((T) vecino,vecino.getId());
		datos.put((T) vecino.getComunidad(),vecino.getComunidad().getId());
		datos.put((T) vecino.getId_tipovecino() ,vecino.getId_tipovecino().getId());
		datos.put((T) vecino.getPoblacion(),vecino.getPoblacion().getId());
		checkForeignKey.checkForeignKey(datos);
		
		if(vecino.getPass().equals("")) {
			VecinoBean vecinoAux = genericService.get(VecinoBean.class, vecino.getId());
			vecino.setPass(vecinoAux.getPass());
		}
		
		
		return new ResponseBean(200, genericService.saveOrUpdate(vecino));
	}
	
	@RequestMapping(value="/editperfil", method=RequestMethod.POST)
	public<T> ResponseBean editperfil(@RequestBody VecinoBean vecino) {
		check.checkPermissions(2);
		
		HashMap<T, Integer> datos = new HashMap<T, Integer>();
		datos.put((T) vecino,vecino.getId());
		datos.put((T) vecino.getComunidad(),vecino.getComunidad().getId());
		datos.put((T) vecino.getId_tipovecino() ,vecino.getId_tipovecino().getId());
		datos.put((T) vecino.getPoblacion(),vecino.getPoblacion().getId());
		checkForeignKey.checkForeignKey(datos);
		
		VecinoBean vecinoEdited = editProfileValidator.validatorChangeProfile(vecino);
		
		return new ResponseBean(200, genericService.saveOrUpdate(vecinoEdited));
		
	}
}

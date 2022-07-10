package com.angular.controller;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import com.angular.Repository.PackageRepository;
import com.angular.Repository.ProcedureRepository;
import com.angular.model.Package;
import com.google.gson.Gson;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.angular.Repository.cpdHospitalTaggedRepository;
import com.angular.Repository.cpdRepository;
import com.angular.model.CpdModel;
import com.angular.model.cpdhospitatagged;
import com.angular.model.Procedure;

@Controller
public class cpdcontroller {

	@Autowired
	private cpdHospitalTaggedRepository cpdHospitalTaggedRepository;
	
	@Autowired
	private cpdRepository cpdRepository ;
	
	@Autowired
 private ProcedureRepository procedureRepository;
	
	@Autowired
	private PackageRepository packageRepository;

	@GetMapping(value = "/cpdforsave")
	public String cpdprocess(Model model) {
		List<cpdhospitatagged> cpaCpdhospitataggedList = cpdHospitalTaggedRepository.findAll();
		model.addAttribute("cpaCpdhospitataggedList", cpaCpdhospitataggedList);
		List<Procedure> procedureList = procedureRepository.findAll();
		model.addAttribute("procedureList",procedureList);
		List<Package> packageList = packageRepository.findAll();
		model.addAttribute("packageList",packageList);
		model.addAttribute("cpdsaveprocesspractice", new CpdModel());
		return "cpd";

	}

	@RequestMapping(value = "/cpdsavemethode",method = RequestMethod.POST)
	public String save(Model model,@RequestParam(value = "dcName",required = false) String dcName,
			@RequestParam(value = "dcType",required = false) String dcType,
			@RequestParam(value = "dob",required = false) String dob,
			@RequestParam(value = "mobile",required = false) String mobile,
			@RequestParam(value = "proc",required = false) String proc,
			@RequestParam(value = "pack",required = false) String pack,
			@RequestParam(value = "dateofjoinng",required = false) String dateofjoinng,
			@RequestParam(value = "Multiplehospital",required = false) String Multiplehospital,
	        @RequestParam(value = "Active",required = false) String Active){

	CpdModel cpdModel =new CpdModel();
	cpdModel.setCpdid(0);
	cpdModel.setActive(Active);
	cpdModel.setDateofjoinng(dateofjoinng);
	cpdModel.setDcName(dcName);
	cpdModel.setDcType(dcType);
	cpdModel.setDob(dob);
	cpdModel.setMobile(mobile);
	cpdModel.setMultiplehospital(Multiplehospital);
	cpdModel.setPack(pack);
	cpdModel.setProc(proc);
    
	cpdRepository.save(cpdModel);
	return "redirect:/cpdforsave";
	}

	@ResponseBody
	@GetMapping("getPackageData/{packageCategoryName}")
	public String getProcData(@PathVariable String packageCategoryName){
		Gson gson = new Gson();
		return gson.toJson(packageRepository.findAllByCategoryCode(packageCategoryName));
	}
}
package pers.qingyu.home.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class HomeBean {

	private String homeLocation;
	private String homeInformation;
	private String homeInclude;
	private String service;
}

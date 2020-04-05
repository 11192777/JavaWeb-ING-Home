package pers.qingyu.home.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
public class TenantBean {

	private String userId;
	private String userName;
	private String phoneNumber;
	private String workLocation;
	
	
}

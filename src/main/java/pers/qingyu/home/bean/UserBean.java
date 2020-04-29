package pers.qingyu.home.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserBean {
	
	private String userId;
	private String userPasswd;
	private String phoneNumber;
}

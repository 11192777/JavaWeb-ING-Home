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
public class UserInformationBean {
	public static String DEFAULT_HEADING_IMG = "";

	private String userId;
	private String userName;
	private String headImgPath;
	private String userSex;
	private Integer userAge;
	private String idCard;
	private String hosting;
	private String location;
}

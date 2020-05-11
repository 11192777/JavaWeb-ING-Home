package pers.qingyu.home.bean;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RecordBean {

	private String userName;
	private String visitName;
	private Integer tower;
	private Timestamp time;
}

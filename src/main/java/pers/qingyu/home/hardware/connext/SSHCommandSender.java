package pers.qingyu.home.hardware.connext;

import java.io.UnsupportedEncodingException;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.iot.model.v20180120.RRpcRequest;
import com.aliyuncs.iot.model.v20180120.RRpcResponse;

import pers.qingyu.home.util.UtilHelper;

public class SSHCommandSender {

	// 用户账号AccessKey
	private static String accessKeyID = "LTAI4FvzQDy8BPLhyoqG26oQ";
	// 用户账号AccesseKeySecret
	private static String accessKeySecret = "usm1XzBweKXG1l2i26Q2JZp2fBV3NM";
	// 产品Key
	private static String productKey = "a1Ptx6mmc6q";

	private static String deviceName = "raspberrypiQR_1";

	// ===================需要填写的参数结束===========================

	public static void main(String[] args) throws ServerException, ClientException, UnsupportedEncodingException {

		String payload = "hello";

		RRpcRequest request = new RRpcRequest();

		request.setProductKey(productKey);

		request.setDeviceName(deviceName);

		request.setRequestBase64Byte(UtilHelper.byte2Base64StringFun(payload.getBytes()));

		request.setTimeout(5000);

		DefaultAcsClient client = OpenApiClient.getClient(accessKeyID, accessKeySecret);

		// 发起RRPC请求

		RRpcResponse response = (RRpcResponse) client.getAcsResponse(request);

		// RRPC响应处理

		// response.getSuccess()仅表明RRPC请求发送成功，不代表设备接收成功和响应成功

		// 需要根据RrpcCode来判定，参考文档https://help.aliyun.com/document_detail/69797.html

		if (response != null && "SUCCESS".equals(response.getRrpcCode())) {

			// 回显

			System.out.println(new String(UtilHelper.base64String2ByteFun(response.getPayloadBase64Byte())));

		} else {
			// 回显失败，打印rrpc code
			System.out.println(response.getRrpcCode());

		}
	}

}
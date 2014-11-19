package P7_ForgetPassWord.model;

public class ForgetPassWordRandom {
	public String num(){
		
		int[] word = new int[8];
		int mod;
		String newPass;
		for (int i = 0; i < 8; i++) {
			//隨機亂碼
			mod = (int) ((Math.random() * 7) % 3);
			if (mod == 1) { // 數字
				word[i] = (int) ((Math.random() * 10) + 48);
			} else if (mod == 2) { // 大寫英文
				word[i] = (char) ((Math.random() * 26) + 65);
			} else { // 小寫英文
				word[i] = (char) ((Math.random() * 26) + 97);
			}
		}
		StringBuffer newPassword = new StringBuffer();
		for (int j = 0; j < 8; j++) {
			newPassword.append((char) word[j]);
		}
		newPass=newPassword.toString();
		
		return newPass;
	}
}

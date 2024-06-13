import http from '@ohos.net.http'
import UserInfo from '../viewmodel/user/UserInfo'
import PreferencesUtil from '../common/util/PreferencesUtil'


class LoginService {
  baseURL: string = 'http://127.0.0.1:4523/m1/4527099-4174694-default/user/login'
  // context: common.UIAbilityContext

  /**
   * 登录并获取登录者ID信息
   * 在登录时调用
   * @param userName
   * @param userPassword
   * @returns 登录者userId
   */

  login(userName: string, userPassword: string): Promise<number>{
    return new Promise((resolve, reject) => {

    })
  }


  /*
  login(userName: string, userPassword: string): Promise<UserInfo>{
    return new Promise((resolve, reject) => {
      //1.创建http的请求对象
      let httpRequest = http.createHttp()

      //2.发出请求
      httpRequest.request(
        `${this.baseURL}`,
        {
          method: http.RequestMethod.GET,
          extraData: { userName: userName, userPassword: userPassword }
        }
      )
        .then(resp => {
          if (resp.responseCode === 200) {
            //查询成功
            console.log('查询用户成功\n', resp.result)
            resolve(JSON.parse(resp.result.toString()))
          } else {
            console.log('查询失败1', JSON.stringify(resp))
            reject('查询用户失败')
          }
        })
        .catch(error => {
          console.log('查询失败2', JSON.stringify(error))
          reject('查询用户失败')
        })


    })
  }
  */

  /*
//储存用户信息到用户首选项
dataPreferences.getPreferences(this.context, 'userPreferences').then(preferences => {
  preferences.put('userInfo', JSON.stringify(resultData.data)).then(() => {
  //数据持久化
    preferences.flush().then(() => {
      console.info("用户信息已保存到用户首选项");
      resolve(resultData.data);
    }).catch(error => {
      console.error("用户信息持久化失败: ", error);
      reject('用户信息持久化失败');
    });

  }).catch(error => {
    console.error("存储用户信息失败: ", error);
    reject('存储用户信息失败');
  });

}).catch(error => {
  console.error("存储用户信息失败: ", error);
  reject('存储用户信息失败');
})
*/


  /**
   * 提供用户信息注册
   * @param userName
   * @param userPassword
   * @param phoneNumber
   * @param email
   * @returns 是否注册成功(账户已存在，成功)
   */
  register(userName: string, userPassword: string, phoneNumber: string, email: string): Promise<boolean>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 发送并获取手机验证码
   * @param phoneNumber
   * @returns 验证码
   */
  getPhoneVerify(phoneNumber: string): Promise<string>{
    return new Promise((resolve, reject) =>{

    })
  }

  /**
   * 修改密码
   * @param userId
   * @param oldPassword
   * @param newPassword
   * @returns 是否修改成功（成功，密码与之前相同）
   */
  alterPassword(userId: number, oldPassword: string, newPassword: string): Promise<boolean>{
    return new Promise((resolve, reject) =>{

    })
  }

  /**
   * 忘记密码时通过手机号修改密码
   * @param phoneNumber
   * @param newPassword
   * @returns 是否修改成功
   */
  forgetPassword(phoneNumber: string, newPassword: string): Promise<boolean>{
    return new Promise(() => {

    })
  }

}


let loginService = new LoginService()

export default loginService as LoginService
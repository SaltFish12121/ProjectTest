import RegionInfo from './RegionInfo'
import KlassInfo from  './KlassInfo'
import dataPreferences from '@ohos.data.preferences'

export default class UserInfo{
  id: number
  name: string
  studentNumber: string
  userPassword: string

  region: RegionInfo
  gender: string
  otherName: string

  klass: KlassInfo

  phoneNumber: string
  email: string
  idNumber: string

  ifBinding: boolean


  constructor(userId: number = 0, userName: string = '默认', studentNumber: string = '', userPassword: string = '',
              region: RegionInfo = new RegionInfo(), gender: string = '', pictureUrl: any = '',
              klass: KlassInfo = new KlassInfo(),
              phoneNumber: string = '', email: string = '', idNumber: string = '', ifBinding: boolean = false) {
    this.id = userId
    this.name = userName
    this.studentNumber = studentNumber
    this.userPassword = userPassword

    this.region = region
    this.gender = gender
    this.otherName = pictureUrl

    this.klass = klass

    this.phoneNumber = phoneNumber
    this.email = email
    this.idNumber = idNumber

    this.ifBinding = ifBinding
  }

}

enum Gender{
  man = '男',
  female = '女'
}

export class PreferenceManager {
  private context: any

  constructor(context: any) {
    this.context = context
  }

  async saveUserInfo(userInfo: UserInfo): Promise<void>{
    const preferences = await dataPreferences.getPreferences(this.context, 'userPreferences');
    await preferences.put('userInfo', JSON.stringify(userInfo));
    await preferences.flush();
  }

  async getUserInfo(): Promise<UserInfo | null> {
    const preferences = await dataPreferences.getPreferences(this.context, 'userPreferences');
    const userInfoJson = await preferences.get('userInfo', '');

    // 使用类型守卫来确保userInfoJson是一个字符串
    if (typeof userInfoJson === 'string') {
      return JSON.parse(userInfoJson) as UserInfo;
    } else {
      return null;
    }
  }

}
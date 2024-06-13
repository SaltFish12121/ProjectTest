
export default class KlassInfo{
  id: number
  name: string
  school: string
  grade: string
  teacher: string

  constructor(id: number = 0, name: string = '', school: string = '', grade: string = '', teacher: string = '') {
    this.id = id
    this.name = name
    this.school = school
    this.grade = grade
    this.teacher = teacher
  }
}
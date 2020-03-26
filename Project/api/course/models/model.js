const sql = require ('../../../config/mysqlConnection');
const Course = course => {
  this.id = course.id;
  this.name = course.name;
  this.description = course.description;
  this.created_by = course.created_by;
  this.created_at = course.created_at;
  this.updated_by = course.updated_by;
  this.updated_at = course.updated_at;
};
Course.getAllCourse = async result => {
  sql.query ('SELECT * FROM course WHERE id = ?', (err, res) => {
    if (err) {
      console.log ('err:', err);
      result (null, err);
    } else {
      console.log ('tasks : ', res);
      result (null, res);
    }
  });
};

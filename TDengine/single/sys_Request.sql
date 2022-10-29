DROP TABLE IF EXISTS `Request`;
CREATE TABLE `Request` (`date` timestamp, `id` bigint, `debug` tinyint, `version` tinyint, `method` nchar(10), `tag` nchar(30), `structure` nchar(4000), `detail` nchar(4000));
INSERT INTO `Request` (`id`, `debug`, `version`, `method`, `tag`, `structure`, `detail`, `date`) VALUES (1,0,1,'POST','register','{\"User\": {\"MUST\": \"name\", \"REFUSE\": \"id\", \"UPDATE\": {\"id@\": \"Privacy/id\"}}, \"Privacy\": {\"MUST\": \"_password,phone\", \"REFUSE\": \"id\", \"UNIQUE\": \"phone\", \"VERIFY\": {\"phone~\": \"PHONE\"}}}','UNIQUE校验phone是否已存在。VERIFY校验phone是否符合手机号的格式','2017-02-01 11:19:51'),(2,0,1,'POST','Moment','{\"INSERT\": {\"@role\": \"OWNER\", \"pictureList\": [], \"praiseUserIdList\": []}, \"REFUSE\": \"id\", \"UPDATE\": {\"verifyIdList-()\": \"verifyIdList(praiseUserIdList)\", \"verifyURLList-()\": \"verifyURLList(pictureList)\"}}','INSERT当没传pictureList和praiseUserIdList时用空数组[]补全，保证不会为null','2017-02-01 11:19:51'),(3,0,1,'POST','Comment','{\"MUST\": \"momentId,content\", \"REFUSE\": \"id\", \"UPDATE\": {\"@role\": \"OWNER\"}}','必须传userId,momentId,content，不允许传id','2017-02-01 11:19:51'),(4,0,1,'PUT','User','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"phone\"}','必须传id，不允许传phone。INSERT当没传@role时用OWNER补全','2017-02-01 11:19:51'),(5,0,1,'DELETE','Moment','{\"Moment\": {\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"UPDATE\": {\"commentCount()\": \"deleteCommentOfMoment(id)\"}}}',NULL,'2017-02-01 11:19:51'),(6,0,1,'DELETE','Comment','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"UPDATE\": {\"childCount()\": \"deleteChildComment(id)\"}}','disallow没必要用于DELETE','2017-02-01 11:19:51'),(8,0,1,'PUT','User-phone','{\"User\": {\"MUST\": \"id,phone,_password\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"!\", \"UPDATE\": {\"@combine\": \"_password\"}}}','! 表示其它所有，这里指necessary所有未包含的字段','2017-02-01 11:19:51'),(14,0,1,'POST','Verify','{\"MUST\": \"phone,verify\", \"REFUSE\": \"!\"}','必须传phone,verify，其它都不允许传','2017-02-18 14:20:43'),(15,0,1,'GETS','Verify','{\"MUST\": \"phone\"}','必须传phone','2017-02-18 14:20:43'),(16,0,1,'HEADS','Verify','{}','允许任意内容','2017-02-18 14:20:43'),(17,0,1,'PUT','Moment','{\"MUST\": \"id\", \"REFUSE\": \"userId,date\", \"UPDATE\": {\"@role\": \"OWNER\", \"verifyIdList-()\": \"verifyIdList(praiseUserIdList)\", \"verifyURLList-()\": \"verifyURLList(pictureList)\"}}',NULL,'2017-02-01 11:19:51'),(21,0,1,'HEADS','Login','{\"MUST\": \"userId,type\", \"REFUSE\": \"!\"}',NULL,'2017-02-18 14:20:43'),(22,0,1,'GETS','User','{}','允许传任何内容，除了表对象','2017-02-18 14:20:43'),(23,0,1,'PUT','Privacy','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}}','INSERT当没传@role时用OWNER补全','2017-02-01 11:19:51'),(25,0,1,'PUT','Praise','{\"MUST\": \"id\"}','必须传id','2017-02-01 11:19:51'),(26,0,1,'DELETE','Comment[]','{\"Comment\": {\"MUST\": \"id{}\", \"INSERT\": {\"@role\": \"OWNER\"}}}','DISALLOW没必要用于DELETE','2017-02-01 11:19:51'),(27,0,1,'PUT','Comment[]','{\"Comment\": {\"MUST\": \"id{}\", \"INSERT\": {\"@role\": \"OWNER\"}}}','DISALLOW没必要用于DELETE','2017-02-01 11:19:51'),(28,0,1,'PUT','Comment','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}}','这里省略了Comment，因为tag就是Comment，Parser.getCorrectRequest会自动补全','2017-02-01 11:19:51'),(29,0,1,'GETS','login','{\"Privacy\": {\"MUST\": \"phone,_password\", \"REFUSE\": \"id\"}}',NULL,'2017-10-15 10:04:52'),(30,0,1,'PUT','balance+','{\"Privacy\": {\"MUST\": \"id,balance+\", \"REFUSE\": \"!\", \"VERIFY\": {\"balance+&{}\": \">=1,<=100000\"}}}','验证balance+对应的值是否满足>=1且<=100000','2017-10-21 08:48:34'),(31,0,1,'PUT','balance-','{\"Privacy\": {\"MUST\": \"id,balance-,_password\", \"REFUSE\": \"!\", \"UPDATE\": {\"@combine\": \"_password\"}, \"VERIFY\": {\"balance-&{}\": \">=1,<=10000\"}}}','UPDATE强制把_password作为WHERE条件','2017-10-21 08:48:34'),(32,0,2,'GETS','Privacy','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"_password,_payPassword\"}',NULL,'2017-06-12 16:05:51'),(33,0,2,'GETS','Privacy-CIRCLE','{\"Privacy\": {\"MUST\": \"id\", \"REFUSE\": \"!\", \"UPDATE\": {\"@role\": \"CIRCLE\", \"@column\": \"phone\"}}}',NULL,'2017-06-12 16:05:51'),(35,0,2,'POST','Document','{\"Document\": {\"MUST\": \"name,url,request\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"id\"}, \"TestRecord\": {\"MUST\": \"response\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"id,documentId\", \"UPDATE\": {\"documentId@\": \"Document/id\"}}}',NULL,'2017-11-26 08:34:41'),(36,1,2,'PUT','Document','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"userId\"}',NULL,'2017-11-26 08:35:15'),(37,1,2,'DELETE','Document','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"!\", \"UPDATE\": {\"Random\": {\"@role\": \"OWNER\", \"documentId@\": \"Method/id\"}, \"TestRecord\": {\"@role\": \"OWNER\", \"documentId@\": \"Document/id\"}}}',NULL,'2017-11-26 00:36:20'),(38,0,2,'POST','TestRecord','{\"MUST\": \"documentId,response\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"id\"}',NULL,'2018-06-16 23:44:36'),(39,1,2,'POST','Method','{\"Method\": {\"MUST\": \"method,class,package\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"id\"}, \"TestRecord\": {\"MUST\": \"response\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"id,documentId\", \"UPDATE\": {\"documentId@\": \"Method/id\"}}}',NULL,'2017-11-26 00:34:41'),(40,1,2,'PUT','Method','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"userId\"}',NULL,'2017-11-26 00:35:15'),(41,1,2,'DELETE','Method','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"!\"}',NULL,'2017-11-25 16:36:20'),(42,0,2,'POST','Random','{\"INSERT\": {\"@role\": \"OWNER\"}, \"Random\": {\"MUST\": \"documentId,name,config\"}, \"TestRecord\": {\"UPDATE\": {\"randomId@\": \"/Random/id\", \"documentId@\": \"/Random/documentId\"}}}',NULL,'2017-11-26 00:34:41'),(43,1,2,'PUT','Random','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"userId\"}',NULL,'2017-11-26 00:35:15'),(44,1,2,'DELETE','Random','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"UPDATE\": {\"TestRecord\": {\"@role\": \"OWNER\", \"randomId@\": \"/id\"}}}',NULL,'2017-11-25 16:36:20'),(45,0,2,'POST','Comment:[]','{\"TYPE\": {\"Comment[]\": \"OBJECT[]\"}, \"INSERT\": {\"@role\": \"OWNER\"}, \"Comment[]\": []}',NULL,'2020-03-01 05:40:04'),(46,0,2,'POST','Moment:[]','{\"INSERT\": {\"@role\": \"OWNER\"}, \"Moment[]\": []}',NULL,'2020-03-01 05:41:42'),(47,0,2,'PUT','Comment:[]','{\"INSERT\": {\"@role\": \"OWNER\"}, \"Comment[]\": []}',NULL,'2020-03-01 05:40:04'),(48,1,2,'DELETE','TestRecord','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}}',NULL,'2017-11-25 16:36:20'),(49,0,2,'POST','Input','{\"MUST\": \"deviceId,x,y\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"id\"}',NULL,'2017-11-26 00:34:41'),(50,0,2,'POST','Device','{\"MUST\": \"brand,model\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"id\"}',NULL,'2017-11-26 00:34:41'),(51,0,2,'POST','System','{\"MUST\": \"type,versionCode,versionName\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"id\"}',NULL,'2017-11-26 00:34:41'),(52,0,2,'POST','Flow','{\"MUST\": \"deviceId,systemId,name\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"id\"}',NULL,'2017-11-26 00:34:41'),(53,0,4,'GETS','Privacy','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"!\"}',NULL,'2017-06-12 16:05:51'),(54,0,2,'POST','Output','{\"MUST\": \"inputId\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"id\"}',NULL,'2018-06-16 23:44:36'),(55,0,2,'DELETE','Output','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}}',NULL,'2017-11-25 16:36:20'),(56,0,3,'DELETE','Method','{\"MUST\": \"id\", \"INSERT\": {\"@role\": \"OWNER\"}, \"REFUSE\": \"!\"}',NULL,'2017-11-25 16:36:20'),(57,0,4,'GETS','User[]','{\"User\": {\"INSERT\": {\"@role\": \"CIRCLE\"}}, \"REFUSE\": \"query\"}',NULL,'2021-10-21 16:29:32'),(58,0,1,'PUT','Moment-praiseUserIdList+','{\"Moment\": {\"MUST\": \"id\", \"REFUSE\": \"!\", \"UPDATE\": {\"@role\": \"CIRCLE\", \"newListWithCurUserId-()\": \"newListWithCurUserId(praiseUserIdList+)\"}}}','单独针对 Moment 点赞设置校验规则（允许圈子成员操作自己的数据）','2017-02-01 11:19:51'),(59,0,1,'PUT','Moment-praiseUserIdList-','{\"Moment\": {\"MUST\": \"id\", \"REFUSE\": \"!\", \"UPDATE\": {\"@role\": \"CIRCLE\", \"praiseUserIdList--()\": \"newListWithCurUserId()\"}}}','单独针对 Moment 取消点赞设置校验规则（允许圈子成员操作自己的数据）','2017-02-01 11:19:51'),(61,1,1,'POST','Request','{\"MUST\": \"method,tag,structure\", \"INSERT\": {\"@role\": \"LOGIN\"}, \"REFUSE\": \"!detail,!\"}',NULL,'2022-05-02 19:07:37'),(1651614346391,0,1,'GET','momentList','{\"MUST\": \"Moment[].page\", \"TYPE\": {\"format\": \"BOOLEAN\", \"Moment[].page\": \"NUMBER\", \"Moment[].count\": \"NUMBER\"}, \"REFUSE\": \"!Moment[].count,!format,!\"}','查询动态列表类 RESTful 简单接口','2022-05-03 21:46:04'),(1657562189773,0,1,'GET','moments','{\"MUST\": \"Moment[].page\", \"TYPE\": {\"format\": \"BOOLEAN\", \"Moment[].page\": \"NUMBER\", \"Moment[].count\": \"NUMBER\"}, \"REFUSE\": \"!Moment[].count,!format,!\"}','查动态列表类 RESTful 简单接口','2022-07-11 17:56:32');
import sqlite3

def createSmtpDb():
	conn = sqlite3.connect("nasSmtp.db")
	cursor = conn.cursor()
	cursor.execute(''' create table SmtpTable (id integer primary key,
		smtpServerIp text, 
		loginName text, loginPassword text, fromAddr text,
		toAddrs text) ''' )
	cursor.execute(''' insert into SmtpTable (id) values (1) ''')
	cursor.close()
	conn.commit()
	conn.close()

def isPathShared(path):
	conn = sqlite3.connect(dbName)
	cursor = conn.cursor()
	sql = "select * from " + tableName + " where path = '" + path + "'"
	cursor.execute(sql)
	data=cursor.fetchone()
	isShare = 0
	if data is None:
		isShare = 0
	else:
		isShare = 1
	cursor.close()
	conn.commit()
	conn.close()

def getSmtpData():
	conn = sqlite3.connect("nasSmtp.db")
	cursor = conn.cursor()
	sql = "select * from SmtpTable"
	cursor.execute(sql)
	smtpServerIp = ""
	loginName = ""
	loginPassword = ""
	fromAddr = ""
	toAddrs = ""
	for data in cursor:
		smtpServerIp = data[1]
		loginName = data[2]
		loginPassword = data[3]
		fromAddr = data[4]
		toAddrs = data[5]
	cursor.close()
	conn.commit()
	conn.close()

def setSmtpSetting(smtpServerIp, loginName, loginPassword, fromAddr, toAddrs):
	conn = sqlite3.connect("nasSmtp.db")
	cursor = conn.cursor()
	sql = "update SmtpTable set smtpServerIp = '" + smtpServerIp + \
		"', loginName = '" + loginName + "', loginPassword = '" + \
		loginPassword + "', fromAddr = '" + fromAddr + \
		"',toAddrs = '" + toAddrs + "' where id = 1"
	cursor.execute(sql)	
	cursor.close()
	conn.commit()
	conn.close()

def addShare(path, shareName):
	conn = sqlite3.connect(dbName)
	cursor = conn.cursor()
	sql = "insert into " + tableName + "('shareName', 'path') values ('" + \
        shareName + "', '" + path + "')"
	cursor.execute(sql)	
	cursor.close()
	conn.commit()
	conn.close()
	
def delShare(path, shareName):
	conn = sqlite3.connect(dbName)
	cursor = conn.cursor()
	sql = "delete from " + tableName +  " where path = '" + path + "'"
	cursor.execute(sql)	
	cursor.close()
	conn.commit()
	conn.close()
	
createSmtpDb()
setSmtpSetting("192.168.1.18", "Andy.Pan", "207622", "Andy.Pan@test.com",  \
               "Ivan.Lou@test.com")
getSmtpData()		


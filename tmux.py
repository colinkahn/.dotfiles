import imaplib
import ConfigParser
import os

class Mailbox:
  def __init__(self, user, password):
    self.m = imaplib.IMAP4_SSL('imap.gmail.com','993')
    self.m.login(user,password)

  def getNumberOfIds(self, li):
    s = li.pop(0)
    return len([i for i in s.split(' ') if i])

  def diffs(self):
    self.m.select("Phabricator/Diffs")
    status, ids = self.m.search(None, 'UNSEEN')
    return self.getNumberOfIds(ids)

  def tasks(self):
    self.m.select("Phabricator/Tasks")
    status, ids = self.m.search(None, 'UNSEEN')
    return self.getNumberOfIds(ids)

if __name__=="__main__":
  config = ConfigParser.ConfigParser()
  config_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'user.cfg')
  try:
    config.read(config_path)
    user = config.get('gmail', 'user')
    password = config.get('gmail', 'password')
    mailbox = Mailbox(user,password)
    print "[DIFFS] %s [TASKS] %s" % (mailbox.diffs(), mailbox.tasks())
  except Exception as e:
    print "~"
    #print "Python Error :( %s" % (e.message)

#!/usr/bin/python
 
# Sample Python client accessing JIRA via SOAP. By default, accesses
# http://jira.atlassian.com with a public account. Methods requiring
# more than basic user-level access are commented out. Change the URL
# and project/issue details for local testing.
#
# Note: This Python client only works with JIRA 3.3.1 and above (see
# http://jira.atlassian.com/browse/JRA-7321)
#
# Refer to the SOAP Javadoc to see what calls are available:
# http://docs.atlassian.com/software/jira/docs/api/rpc-jira-plugin/latest/com/atlassian/jira/rpc/soap/JiraSoapService.html
 
import SOAPpy
import SOAPpy.Types
import getpass
import datetime
import time
 
soap = SOAPpy.WSDL.Proxy('http://jira.atlassian.com/rpc/soap/jirasoapservice-v2?wsdl')
#soap = SOAPpy.WSDL.Proxy('http://localhost:8090/jira/rpc/soap/jirasoapservice-v2?wsdl')
 
#jirauser = raw_input("Username for jira [fred]: ")
#if jirauser == "":
#    jirauser = "fred"
#
#passwd = getpass.getpass("Password for %s: " % jirauser)
#passwd="fredspassword"
 
jirauser='magno'
passwd='nc1702'
 
# This prints available methods, but the WSDL doesn't include argument
# names so its fairly useless. Refer to the Javadoc URL above instead
#print 'Available methods: ', soap.methods.keys()
 
def listSOAPmethods():
    for key in soap.methods.keys():
        print key, ': '
        for param in soap.methods[key].inparams:
        print '\t', param.name.ljust(10), param.type
        for param in soap.methods[key].outparams:
        print '\tOut: ', param.name.ljust(10), param.type
 
 
auth = soap.login(jirauser, passwd)
 
issue = soap.getIssue(auth, 'INFR-1243')
print "Retrieved issue:", issue
print
 
baseurl = soap.getServerInfo(auth)['baseUrl']
newissue = soap.createIssue(auth, {'project': 'INFR', 'type': '1', 'summary': 'Issue created with Python!'})
print "Created %s/browse/%s" % (baseurl, newissue['key'])
 
print "Adding comment.."
soap.addComment(auth, newissue['key'], {'body': 'Comment added with SOAP'})
 
print 'Updating issue..'
soap.updateIssue(auth, newissue['key'], [
        {"id": "summary", "values": ['[Updated] Issue created with Python'] },
 
        # Change issue type to 'New feature'
        {"id":"issuetype", "values":'2'},
 
        # Setting a custom field. The id (10010) is discoverable from
        # the database or URLs in the admin section
 
        {"id": "customfield_10010", "values": ["Random text set in updateIssue method"] },
 
        {"id":"fixVersions", "values":['10331']},
        # Demonstrate setting a cascading selectlist. See   
                # http://confluence.atlassian.com/display/JIRA/Frequently+Asked+RPC+Questions+and+Known+Issues#FrequentlyAskedRPCQuestionsandKnownIssues-Settingthevalueofcascadingselectcustomfield
        {"id": "customfield_10061", "values": ["10098"]},
        {"id": "customfield_10061:1", "values": ["10105"]},
        {"id": "duedate", "values": datetime.date.today().strftime("%d-%b-%y")}
 
        ])
 
print 'Resolving issue..'
# Note: all fields prompted for in the transition (eg. assignee) need to
# be set, or they will become blank.
soap.progressWorkflowAction(auth, newissue['key'], '2', [
        {"id": "assignee", "values": "jefft" },
        {"id":"fixVersions", "values":['10331']},
        {"id": "resolution", "values": "2" }
        ])
 
 
# Re. 'assignee' above, see http://jira.atlassian.com/browse/JRA-9018
 
# This works if you have the right permissions
#user = soap.createUser(auth, "testuser2", "testuser2", "SOAP-created user", "newuser@localhost")
#print "Created user ", user
 
#group = soap.getGroup(auth, "jira-developers")
# Adding a user to a group. Naming the parameters may be required (see
# http://jira.atlassian.com/browse/JRA-7971). You may experience other
# problems (see http://jira.atlassian.com/browse/JRA-7920).
#soap.addUserToGroup(token=auth, group=group, user=user)
 
# Adding a version to a project.
dateObj = SOAPpy.Types.dateTimeType((int(2011), int(1), int(10), int(time.timezone/3600), 0, 0)) 
soap.addVersion(auth, "TST", remoteVersion = {'name': 'Version 1', 'releaseDate': dateObj})
 
print "Done!"
 
# vim set textwidth=1000:
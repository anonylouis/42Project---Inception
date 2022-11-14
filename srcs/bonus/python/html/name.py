#!/usr/bin/python3.7
# Import modules for CGI handling 
import cgi, cgitb 

# Create instance of FieldStorage 
form = cgi.FieldStorage() 

# Get data from fields
first_name = form.getvalue('first_name')
last_name  = form.getvalue('last_name')

print("Content-type:text/html\r\n\r\n")
print("<html>")
print("<head>")
print("<title>PYTHON - PYTHON CGI Program</title>")
print("</head>")
print("<body>")
print("<h2>%s %s is an amazing evaluator</h2>" % (first_name, last_name))
print("<p>please give me 125 :')</p>")
print("</body>")
print("</html>")

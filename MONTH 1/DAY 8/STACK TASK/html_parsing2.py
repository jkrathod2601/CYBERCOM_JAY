from html.parser import HTMLParser
f = open("index.html")
data=f.read()
class MyHTMLParser(HTMLParser):
    start_tag=[]
    result_tag="true"
    l=['hr','br','img','input','base']
    def handle_starttag(self, tag, attrs):
        #print("Encountered a start tag:", tag)
        if tag not in self.l:
            self.start_tag.append(tag)
    
    def handle_endtag(self, tag):
        if len(self.start_tag):
            if tag!=self.start_tag.pop():
                self.result_tag="false"
        else:
            self.result_tag="false"
parser = MyHTMLParser()
parser.feed(data)
print(parser.result_tag)


        

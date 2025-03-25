from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess
import json

class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b'Workflow triggered successfully!')

        # Déclencher le workflow GitHub
        subprocess.run([
            'curl', '-X', 'POST',
            '-H', 'Accept: application/vnd.github.v3+json',
            '-H', 'Authorization: token YOUR_GITHUB_TOKEN',  # Remplacez par votre token GitHub
            '-d', json.dumps({'event_type': 'button_clicked'}),
            'https://api.github.com/repos/7J777/login/dispatches'
        ])

def run(server_class=HTTPServer, handler_class=RequestHandler, port=8000):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f'Starting server on port {port}...')
    httpd.serve_forever()

if __name__ == '__main__':
    run()
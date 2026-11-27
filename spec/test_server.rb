require 'puma'
require 'puma/server'

# Runs a local HTTP server for tests that need real connections.
module TestServer
  # Starts a server for the given Rack application, yields its port and stops the server afterwards.
  def self.run(app)
    server = Puma::Server.new(app, nil, min_threads: 0, max_threads: 4, log_writer: Puma::LogWriter.null)
    server.add_tcp_listener('127.0.0.1', 0)
    thread = server.run
    yield server.connected_ports.first
  ensure
    server&.stop(true)
    thread&.join
  end

  # Returns the port of the client connection that sent the request.
  def self.client_port(env)
    env['puma.socket'].peeraddr[1]
  end
end

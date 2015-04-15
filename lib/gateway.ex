defmodule Gateway do
  use Application

  def start(_type, _args_) do
    import Supervisor.Spec, warn: false

    children = [worker(Gateway.Routing.Rules,[])]
    opts = [strategy: :one_for_one, name: Gateway.Supervisor]
    Supervisor.start_link(children,opts)
  end

end

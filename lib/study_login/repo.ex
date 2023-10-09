defmodule StudyLogin.Repo do
  use Ecto.Repo,
    otp_app: :study_login,
    adapter: Ecto.Adapters.Postgres
end

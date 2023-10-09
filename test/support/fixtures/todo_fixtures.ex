defmodule StudyLogin.TodoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StudyLogin.Todo` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        completed: true,
        name: "some name"
      })
      |> StudyLogin.Todo.create_task()

    task
  end
end

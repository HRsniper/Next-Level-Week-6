defmodule Wabanex.ExercisesTest do
  use Wabanex.DataCase

  alias Wabanex.Exercises
  alias Wabanex.Exercise

  describe "exercises" do

    @valid_attrs %{name: "some name", protocol_description: "some protocol_description", repetitions: "some repetitions", youtube_video_url: "some youtube_video_url"}
    @update_attrs %{name: "some updated name", protocol_description: "some updated protocol_description", repetitions: "some updated repetitions", youtube_video_url: "some updated youtube_video_url"}
    @invalid_attrs %{name: nil, protocol_description: nil, repetitions: nil, youtube_video_url: nil}

    def exercise_fixture(attrs \\ %{}) do
      {:ok, exercise} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Exercises.create_exercise()

      exercise
    end

    test "list_exercises/0 returns all exercises" do
      exercise = exercise_fixture()
      assert Exercises.list_exercises() == [exercise]
    end

    test "get_exercise!/1 returns the exercise with given id" do
      exercise = exercise_fixture()
      assert Exercises.get_exercise!(exercise.id) == exercise
    end

    test "create_exercise/1 with valid data creates a exercise" do
      assert {:ok, %Exercise{} = exercise} = Exercises.create_exercise(@valid_attrs)
      assert exercise.name == "some name"
      assert exercise.protocol_description == "some protocol_description"
      assert exercise.repetitions == "some repetitions"
      assert exercise.youtube_video_url == "some youtube_video_url"
    end

    test "create_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exercises.create_exercise(@invalid_attrs)
    end

    test "update_exercise/2 with valid data updates the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{} = exercise} = Exercises.update_exercise(exercise, @update_attrs)
      assert exercise.name == "some updated name"
      assert exercise.protocol_description == "some updated protocol_description"
      assert exercise.repetitions == "some updated repetitions"
      assert exercise.youtube_video_url == "some updated youtube_video_url"
    end

    test "update_exercise/2 with invalid data returns error changeset" do
      exercise = exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Exercises.update_exercise(exercise, @invalid_attrs)
      assert exercise == Exercises.get_exercise!(exercise.id)
    end

    test "delete_exercise/1 deletes the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{}} = Exercises.delete_exercise(exercise)
      assert_raise Ecto.NoResultsError, fn -> Exercises.get_exercise!(exercise.id) end
    end

    test "change_exercise/1 returns a exercise changeset" do
      exercise = exercise_fixture()
      assert %Ecto.Changeset{} = Exercises.change_exercise(exercise)
    end
  end
end

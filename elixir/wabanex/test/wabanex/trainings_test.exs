defmodule Wabanex.TrainingsTest do
  use Wabanex.DataCase

  alias Wabanex.Trainings
  alias Wabanex.Training

  describe "trainings" do
    @valid_attrs %{end_date: ~D[2010-04-17], start_date: ~D[2010-04-17]}
    @update_attrs %{end_date: ~D[2011-05-18], start_date: ~D[2011-05-18]}
    @invalid_attrs %{end_date: nil, start_date: nil}

    def training_fixture(attrs \\ %{}) do
      {:ok, training} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trainings.create_training()

      training
    end

    test "list_trainings/0 returns all trainings" do
      training = training_fixture()
      assert Trainings.list_trainings() == [training]
    end

    test "get_training!/1 returns the training with given id" do
      training = training_fixture()
      assert Trainings.get_training!(training.id) == training
    end

    test "create_training/1 with valid data creates a training" do
      assert {:ok, %Training{} = training} = Trainings.create_training(@valid_attrs)
      assert training.end_date == ~D[2010-04-17]
      assert training.start_date == ~D[2010-04-17]
    end

    test "create_training/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trainings.create_training(@invalid_attrs)
    end

    test "update_training/2 with valid data updates the training" do
      training = training_fixture()
      assert {:ok, %Training{} = training} = Trainings.update_training(training, @update_attrs)
      assert training.end_date == ~D[2011-05-18]
      assert training.start_date == ~D[2011-05-18]
    end

    test "update_training/2 with invalid data returns error changeset" do
      training = training_fixture()
      assert {:error, %Ecto.Changeset{}} = Trainings.update_training(training, @invalid_attrs)
      assert training == Trainings.get_training!(training.id)
    end

    test "delete_training/1 deletes the training" do
      training = training_fixture()
      assert {:ok, %Training{}} = Trainings.delete_training(training)
      assert_raise Ecto.NoResultsError, fn -> Trainings.get_training!(training.id) end
    end

    test "change_training/1 returns a training changeset" do
      training = training_fixture()
      assert %Ecto.Changeset{} = Trainings.change_training(training)
    end
  end
end

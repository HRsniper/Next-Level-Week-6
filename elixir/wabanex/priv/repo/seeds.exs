# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Wabanex.Repo.insert!(%Wabanex.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Wabanex.Repo.insert!(%Wabanex.User{email: "hr@email.com", name: "Hercules", password: "123456"})

Wabanex.Repo.insert!(%Wabanex.Training{
  end_date: ~D[2021-06-28],
  exercises: [
    %Wabanex.Exercise{
      name: "Abdominal",
      protocol_description: "regular",
      repetitions: "10x5",
      updated_at: ~N[2021-06-27 22:10:10],
      youtube_video_url: "youtube.com"
    },
    %Wabanex.Exercise{
      name: "Agachamento",
      protocol_description: "regular",
      repetitions: "10x5",
      youtube_video_url: "youtube.com"
    }
  ],
  start_date: ~D[2021-06-26],
  user_id: "27523bbd-0967-4ce4-9cae-5e4964e76fd3"
})


project_id = attribute('project_id')
region = attribute('region')
df_job_state = attribute('df_job_state')
df_job_id = attribute('df_job_id')
bucket_name = attribute('bucket_name')

control "gcloud" do
  title "jobs ids match"
  describe command("gcloud --project=#{project_id} dataflow jobs list --format=json --region=#{region}") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq '' }


    let(:data) do
      if subject.exit_status == 0
        JSON.parse(subject.stdout)
      else
        {}
      end
    end

    context "gcloud dataflow jobs list OUTPUT" do
      describe "contains all successful and failed jobs for the target project" do
        it "should include the newly created dataflow jobs' job_ids" do
          expect(data).to include(
            including(
              "id" => "#{df_job_id}"
            )
          )
        end
      end
    end

  end
end


control "gcloud_dataflow" do
  title "jobs state"
  describe command("gcloud --project=#{project_id} dataflow jobs list --format=json --region=#{region}") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq '' }


    context "google_dataflow_job 1 state attribute" do
      it "should be a stable state (e.g JOB_STATE_RUNNING or JOB_STATE_PENDING)" do
       expect(df_job_state).to match(/(JOB_STATE_RUNNING|JOB_STATE_PENDING)/)
      end
    end
  end
end




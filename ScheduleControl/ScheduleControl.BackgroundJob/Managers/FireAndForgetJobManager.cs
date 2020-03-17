﻿using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Text;
using System.Threading;
using Hangfire;
using Newtonsoft.Json;
using ScheduleControl.BackgroundJob.Schedules;

namespace ScheduleControl.BackgroundJob.Managers
{
    public static class FireAndForgetJobManager
    {
        
        [Obsolete]
        public static void SendMailJobs()
        {
            Hangfire.BackgroundJob.Enqueue<EmailSendingScheduleJob>
            (
                job => job.Run(JobCancellationToken.Null)
            );
        }
    }
}

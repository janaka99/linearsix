// This is sample ID
const calendarAPI =
  "a1287beae34edd65097e85bda04f91c952ff51cf8da7e518b7f98c367f7eb6c1@group.calendar.google.com";

/**
 *
 * @param {*} calendarId
 * @param {*} startTime ex- 2024-12-12
 * @param {*} endTime ex - 2025-01-31
 * @returns
 */
async function handleSubmit(calendarId, startTime, endTime) {
  const startDate = new Date(startTime);
  const endDate = new Date(endTime);

  const apiKey = "sample_api_key";

  if (!startDate || !endDate) {
    alert("Please select both start and end dates.");
    return;
  }

  if (new Date(startDate) > new Date(endDate)) {
    alert("The start date cannot be later than the end date.");
    return;
  }

  const reqBody = {
    timeMin: startDate.toISOString(),
    timeMax: endDate.toISOString(),
    timeZone: "UTC",
    items: [
      {
        id: calendarId,
      },
    ],
  };

  const res = await fetch(
    `https://www.googleapis.com/calendar/v3/freeBusy?key=${apiKey}`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: reqBody,
    }
  );
  const response = await res.json();
  console.log(response);
}

handleSubmit(calendarAPI, "2021-12-12", "2025-01-31");

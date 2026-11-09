// Dates de parution kiosque pour la collection française, italienne et espagnole.
// Les prochaines dates sont calculées d'après les cadences annoncées/observées.
(() => {
  const addDays = (isoDate, days) => {
    const date = new Date(`${isoDate}T12:00:00Z`);
    date.setUTCDate(date.getUTCDate() + days);
    return date.toISOString().slice(0, 10);
  };
  const weekly = (start, issue, firstIssue) => addDays(start, (issue - firstIssue) * 7);

  const franceDate = issue => {
    if (issue === 1) return '2025-08-21';
    if (issue === 2) return '2025-09-02';
    return weekly('2025-09-09', issue, 3);
  };

  const italyDates = [
    null,
    '2025-08-20', '2025-09-04', '2025-09-18', '2025-10-02',
    '2025-10-16', '2025-10-30', '2025-11-13', '2025-11-27',
    '2025-12-04', '2025-12-11'
  ];
  const italyDate = issue => issue <= 10 ? italyDates[issue] : weekly('2025-12-11', issue, 10);

  const spainDate = issue => {
    const initialDates = [null, '2025-01-07', '2025-01-21', '2025-02-04', '2025-02-18'];
    if (issue <= 4) return initialDates[issue];
    if (issue <= 85) return weekly('2025-03-04', issue, 5);
    if (issue === 86) return '2026-09-15';
    return weekly('2026-09-22', issue, 87);
  };

  window.COMBAT_PATROL_SCHEDULE = Array.from({ length: 90 }, (_, index) => {
    const issue = index + 1;
    return {
      issue,
      france: franceDate(issue),
      italy: italyDate(issue),
      spain: spainDate(issue)
    };
  });
})();

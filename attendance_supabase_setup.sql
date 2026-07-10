-- ============================================================
-- Eurolux Site Attendance — Supabase Table Setup
-- Run this in your Supabase SQL Editor:
-- https://supabase.com/dashboard/project/tyhybxxbhgyuswlizrmc/sql/new
-- ============================================================

-- ── EMPLOYEES TABLE ─────────────────────────────────────────
CREATE TABLE IF NOT EXISTS attendance_employees (
  id         text PRIMARY KEY,
  name       text NOT NULL,
  createdat  timestamptz DEFAULT now()
);

ALTER TABLE attendance_employees ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow all anon" ON attendance_employees;
CREATE POLICY "Allow all anon" ON attendance_employees
  FOR ALL TO anon USING (true) WITH CHECK (true);

-- ── ATTENDANCE RECORDS TABLE ─────────────────────────────────
CREATE TABLE IF NOT EXISTS attendance_records (
  id              text PRIMARY KEY,
  date            text,
  project         text,
  projectlocation text,
  teamleader      text,
  entries         text,   -- JSON array of {employeeName, timeIn, timeOut}
  remarks         text,
  submittedat     text,
  createdat       timestamptz DEFAULT now()
);

ALTER TABLE attendance_records ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow all anon" ON attendance_records;
CREATE POLICY "Allow all anon" ON attendance_records
  FOR ALL TO anon USING (true) WITH CHECK (true);

-- ── VERIFY ──────────────────────────────────────────────────
-- Run these lines separately to confirm tables were created:
-- SELECT * FROM attendance_employees LIMIT 5;
-- SELECT * FROM attendance_records   LIMIT 5;

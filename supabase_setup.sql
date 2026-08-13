-- ============================================================
-- CONTROLE FINANCEIRO - TABELAS SUPABASE
-- Cole e rode este SQL no SQL Editor do Supabase
-- ============================================================

-- Tabela: bills (contas fixas e parceladas)
CREATE TABLE IF NOT EXISTS bills (
  id TEXT PRIMARY KEY,
  user_id UUID DEFAULT auth.uid(),
  data JSONB NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela: credits (compras do cartão)
CREATE TABLE IF NOT EXISTS credits (
  id TEXT PRIMARY KEY,
  user_id UUID DEFAULT auth.uid(),
  data JSONB NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela: incomes (ganhos e receitas)
CREATE TABLE IF NOT EXISTS incomes (
  id TEXT PRIMARY KEY,
  user_id UUID DEFAULT auth.uid(),
  data JSONB NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================================
-- ROW LEVEL SECURITY - Cada usuário só vê os próprios dados
-- ============================================================
ALTER TABLE bills ENABLE ROW LEVEL SECURITY;
ALTER TABLE credits ENABLE ROW LEVEL SECURITY;
ALTER TABLE incomes ENABLE ROW LEVEL SECURITY;

-- Policies: bills
DROP POLICY IF EXISTS "bills_select" ON bills;
DROP POLICY IF EXISTS "bills_insert" ON bills;
DROP POLICY IF EXISTS "bills_update" ON bills;
DROP POLICY IF EXISTS "bills_delete" ON bills;
CREATE POLICY "bills_select" ON bills FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "bills_insert" ON bills FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "bills_update" ON bills FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "bills_delete" ON bills FOR DELETE USING (auth.uid() = user_id);

-- Policies: credits
DROP POLICY IF EXISTS "credits_select" ON credits;
DROP POLICY IF EXISTS "credits_insert" ON credits;
DROP POLICY IF EXISTS "credits_update" ON credits;
DROP POLICY IF EXISTS "credits_delete" ON credits;
CREATE POLICY "credits_select" ON credits FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "credits_insert" ON credits FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "credits_update" ON credits FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "credits_delete" ON credits FOR DELETE USING (auth.uid() = user_id);

-- Policies: incomes
DROP POLICY IF EXISTS "incomes_select" ON incomes;
DROP POLICY IF EXISTS "incomes_insert" ON incomes;
DROP POLICY IF EXISTS "incomes_update" ON incomes;
DROP POLICY IF EXISTS "incomes_delete" ON incomes;
CREATE POLICY "incomes_select" ON incomes FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "incomes_insert" ON incomes FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "incomes_update" ON incomes FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "incomes_delete" ON incomes FOR DELETE USING (auth.uid() = user_id);

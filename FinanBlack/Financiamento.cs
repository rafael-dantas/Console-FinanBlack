using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinanBlack
{
    public class Financiamento
    {
        public string Calcular(string tipoPessoa, double valorCredito, int tipoCredito, int qtdParcela, DateTime dtPrimeiroVencimento)
        {
            string status = "APROVADO";
            double valorTotal = 0;
            double totalvalorJuros = 0;
            if (!ValidarValorCredito(tipoPessoa, valorCredito))
                status = "REPROVADO";
            if (!ValidarQuantidadeParcelas(qtdParcela))
                status = "REPROVADO";
            if (!ValidarDiaPrimeiroVencimento(dtPrimeiroVencimento))
                status = "REPROVADO";

            double juros = ValorJuros(tipoCredito);
            if (juros <= 0 || (tipoCredito == 3 && tipoPessoa.ToUpper() == "F") || (tipoCredito == 4 && tipoPessoa.ToUpper() == "J"))           
                status = "REPROVADO";

            double valorParcela = (valorCredito / qtdParcela);
            valorTotal = valorParcela;
            for(int i = 1; i <= qtdParcela; i++)
            {
                double v = ((valorTotal / 100) * juros);
                totalvalorJuros += v;
                valorTotal += (v + (i > 1 ? valorParcela : 0));
            }

            return string.Format("Status : {0} \n Valor Total : R$ {1} \n Valor juros R$ {2}",status,valorTotal.ToString("n2"), totalvalorJuros.ToString("n2"));
        }

        private bool ValidarValorCredito(string tipoPessoa, double valorCredito)
        {
            if ((valorCredito < 5000.00 && tipoPessoa.ToUpper() == "F") || valorCredito > 1000000.00 || (valorCredito < 15000.00 && tipoPessoa.ToUpper() == "J"))
                return false;
            else
                return true;
        }
        private bool ValidarQuantidadeParcelas(int qtdParcela)
        {
            if (qtdParcela < 5 || qtdParcela > 72)
                return false;
            else
                return true;
        }
        private bool ValidarDiaPrimeiroVencimento(DateTime dtPrimeiroVencimento)
        {
            if (dtPrimeiroVencimento < DateTime.Now.AddDays(15).Date || dtPrimeiroVencimento > DateTime.Now.AddDays(40).Date)
                return false;
            else
                return true;
        }

        private double ValorJuros(int tipoCredito)
        {
            switch (tipoCredito)
            {
                case 1:
                    return 2;
                    break;
                case 2:
                    return 1;
                    break;
                case 3:
                    return 5;
                    break;
                case 4:
                    return 3;
                    break;
                case 5:
                    return 0.720;
                    break;
                default:
                    return 0;
                    break;

            }
        }
    }
}

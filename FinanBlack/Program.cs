using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinanBlack
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("FINAN BLACK");
            Console.WriteLine("");
            Console.WriteLine("-------------");
            Console.WriteLine("");
            Console.WriteLine("TIPO PESSOA");
            Console.WriteLine("F - Fisica");
            Console.WriteLine("J - Juridica");
            string tipoPessoa = Console.ReadLine();
            while (tipoPessoa.ToUpper() != "J" && tipoPessoa.ToUpper() != "F")
            {                
                tipoPessoa = Console.ReadLine();
            }
            Console.WriteLine("");
            Console.WriteLine("--------------------------------------------------------------------");
            Console.WriteLine("Pessoa Fisica Valor minimo : R$ 5.000,00 e Maximo : R$ 1.000.000,00");
            Console.WriteLine("Pessoa Juridica Valor minimo : R$ 15.000,00 e Maximo : R$ 1.000.000,00");
            Console.Write("VALOR CREDITO : ");
            
            double valorCredito = Convert.ToDouble(Console.ReadLine());
            while ((valorCredito < 5000.00 && tipoPessoa.ToUpper() == "F") || valorCredito > 1000000.00 || (valorCredito < 15000.00 && tipoPessoa.ToUpper() == "J"))
            {
                Console.Write("Ops! Valor invalido");
                Console.WriteLine("");
                Console.WriteLine("");
                Console.Write("VALOR CREDITO : ");
                valorCredito = Convert.ToDouble(Console.ReadLine());
            }
            Console.WriteLine("");
            Console.WriteLine("--------------------------------------------------------------------");
            Console.WriteLine("TIPO DE CREDITO : ");
            Console.WriteLine("1 - Credito Direto - Taxa de 2% ao mês");
            Console.WriteLine("2 - Credito Consignado - Taxa de 1% ao mês");
            Console.WriteLine("3 - Credito Pessoa Jurídica - Taxa de 5% ao mês");
            Console.WriteLine("4 - Credito Pessoa Física - Taxa de 3% ao mês");
            Console.WriteLine("5 - Credito Imobiliário - Taxa de 9% ao ano");
            Console.WriteLine("");
            Console.Write("ESCOLHA OPÇÂO DE CREDITO : ");
            int tipoCredito = Convert.ToInt32(Console.ReadLine());
            while((tipoCredito < 0 || tipoCredito > 5) || (tipoCredito == 3 && tipoPessoa.ToUpper() == "F") || (tipoCredito == 4 && tipoPessoa.ToUpper() == "J"))
            {
                Console.Write("Ops! Tipo de credito invalido");
                Console.WriteLine("");
                Console.WriteLine("");
                Console.Write("ESCOLHA OPÇÂO DE CREDITO :");
                tipoCredito = Convert.ToInt32(Console.ReadLine());
            }
            Console.WriteLine("");
            Console.WriteLine("--------------------------------------------------------------------");
            Console.WriteLine("Escolha de 5 a 72x ");
            Console.Write("Quantidade de parcelas : ");
            int qtdParcela = Convert.ToInt32(Console.ReadLine());
            while (qtdParcela < 5 || qtdParcela > 72)
            {
                Console.Write("Ops! Quantidade de parcela invalida");
                Console.WriteLine("");
                Console.WriteLine("");
                Console.Write("Quantidade de parcelas : ");
                qtdParcela = Convert.ToInt32(Console.ReadLine());
            }
            
            Console.WriteLine("");
            Console.WriteLine("--------------------------------------------------------------------");
            Console.WriteLine("Data do primeiro vencimento, escolha entre : "+ DateTime.Now.AddDays(15).Date + " Até " + DateTime.Now.AddDays(40).Date);
            Console.WriteLine("");
            Console.Write("Data do primeiro vencimento : ");

            string data = Console.ReadLine();
            DateTime dtPrimeiroVencimento = Convert.ToDateTime(data);
            while (dtPrimeiroVencimento < DateTime.Now.AddDays(15).Date || dtPrimeiroVencimento > DateTime.Now.AddDays(40).Date)
            {
                Console.Write("Ops! Quantidade de parcela invalida");
                Console.WriteLine("");
                Console.WriteLine("");
                Console.Write("Data do primeiro vencimento : ");
                data = Console.ReadLine();
                dtPrimeiroVencimento = Convert.ToDateTime(data);
            }

            Financiamento fin = new Financiamento();
            Console.WriteLine("");
            Console.WriteLine("-----------------------------------------------------------------------");
            Console.WriteLine("Resultado da analise de Credito :");
            Console.WriteLine("");
            Console.WriteLine(fin.Calcular(tipoPessoa, valorCredito, tipoCredito, qtdParcela, dtPrimeiroVencimento));

            Console.ReadKey();
        }
    }
}

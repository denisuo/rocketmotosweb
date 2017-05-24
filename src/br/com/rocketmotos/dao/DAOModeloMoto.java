package br.com.rocketmotos.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.rocketmotos.entidade.EntidadeMarcaMoto;
import br.com.rocketmotos.entidade.EntidadeModeloMoto;

public class DAOModeloMoto extends Conexao {

	private static String NM_ENTIDADE = DAOModeloMoto.class.getSimpleName();

	public DAOModeloMoto() {

	}

	public static void incluir(EntidadeModeloMoto eModeloMoto) {

		String sql = "INSERT INTO " + EntidadeModeloMoto.NM_TABELA + " ("
				+ EntidadeModeloMoto.NM_COL_Nome + ", "
				+ EntidadeModeloMoto.NM_COL_CodigoMarcaMoto + ", "
				+ EntidadeModeloMoto.NM_COL_Cilindrada + ") values ('"
				+ eModeloMoto.getNome() + "', "
				+ eModeloMoto.getCodigoMarcaMoto() + ", '"
				+ eModeloMoto.getCilindrada() + "')";
		PreparedStatement stmt = getPreparedStatement(sql);

		try {
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Erro ao inserir em " + NM_ENTIDADE);
			System.out.println(e.getMessage());
			System.out.println(e.getCause());
		}
	}

	public static void alterar(EntidadeModeloMoto eModeloMoto) {
		boolean retorno = false;

		String sql = "UPDATE " + EntidadeModeloMoto.NM_TABELA + " SET "
				+ EntidadeModeloMoto.NM_COL_Nome + " = '"
				+ eModeloMoto.getNome() + "', "
				+ EntidadeModeloMoto.NM_COL_Cilindrada + " = '"
				+ eModeloMoto.getCilindrada() + "', "
				+ EntidadeModeloMoto.NM_COL_CodigoMarcaMoto + " = "
				+ eModeloMoto.getCodigoMarcaMoto() + " WHERE "
				+ EntidadeModeloMoto.NM_COL_CodigoModeloMoto + " = "
				+ eModeloMoto.getCodigoModeloMoto();
		PreparedStatement stmt = getPreparedStatement(sql);

		try {
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("Erro ao alterar em " + NM_ENTIDADE);
		}
	}

	public static void excluir(Integer codigoModeloMoto) {

		String sql = "DELETE FROM " + EntidadeModeloMoto.NM_TABELA + " WHERE "
				+ EntidadeModeloMoto.NM_COL_CodigoModeloMoto + " = "
				+ codigoModeloMoto;

		// DELETE FROM `modelo_moto` WHERE MODELO_MOTO_CD = 2
		PreparedStatement stmt = getPreparedStatement(sql);

		try {
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("Erro ao alterar em " + NM_ENTIDADE);
		}
	}

	public static ArrayList<EntidadeModeloMoto> consultarTodos() {

		// monta select com inner join em marca moto para recuperar o nome da
		// marca
		String sql = "SELECT " + EntidadeModeloMoto.NM_TABELA + ".*, "
				+ EntidadeMarcaMoto.NM_TABELA + "."
				+ EntidadeMarcaMoto.NM_COL_Nome + " AS NOME_MARCA " + " FROM "
				+ EntidadeModeloMoto.NM_TABELA + " INNER JOIN "
				+ EntidadeMarcaMoto.NM_TABELA + " ON ("
				+ EntidadeMarcaMoto.NM_TABELA + "."
				+ EntidadeMarcaMoto.NM_COL_CodigoMarcaMoto + " = "
				+ EntidadeModeloMoto.NM_TABELA + "."
				+ EntidadeModeloMoto.NM_COL_CodigoMarcaMoto + ")";

		ArrayList<EntidadeModeloMoto> listaRetorno = new ArrayList<EntidadeModeloMoto>();
		PreparedStatement stmt = getPreparedStatement(sql);

		try {
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				EntidadeModeloMoto eModeloMoto = new EntidadeModeloMoto();
				eModeloMoto
						.setCodigoModeloMoto(Integer.valueOf(rs
								.getString(EntidadeModeloMoto.NM_COL_CodigoModeloMoto)));
				eModeloMoto.setNome(rs
						.getString(EntidadeModeloMoto.NM_COL_Nome));
				eModeloMoto.setCodigoMarcaMoto(Integer.valueOf(rs
						.getString(EntidadeModeloMoto.NM_COL_CodigoMarcaMoto)));
				eModeloMoto.setCilindrada(rs
						.getString(EntidadeModeloMoto.NM_COL_Cilindrada));
				eModeloMoto.setNomeMarcaMoto(rs
						.getString(EntidadeMarcaMoto.NM_COL_CodigoMarcaMoto)
						+ "-" + rs.getString("NOME_MARCA"));

				listaRetorno.add(eModeloMoto);
			}

		} catch (SQLException e) {
			System.out.println("Erro ao consultar em " + NM_ENTIDADE);
		}

		return listaRetorno;
	}

	public static EntidadeModeloMoto consultarPorCodigoModelo(
			Integer codigoModeloMoto) {

		String sql = "SELECT * FROM " + EntidadeModeloMoto.NM_TABELA
				+ " WHERE " + EntidadeModeloMoto.NM_COL_CodigoModeloMoto
				+ " = " + codigoModeloMoto;
		PreparedStatement stmt = getPreparedStatement(sql);

		EntidadeModeloMoto eModeloMoto = new EntidadeModeloMoto();
		try {
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				eModeloMoto
						.setCodigoModeloMoto(Integer.valueOf(rs
								.getString(EntidadeModeloMoto.NM_COL_CodigoModeloMoto)));
				eModeloMoto.setNome(rs
						.getString(EntidadeModeloMoto.NM_COL_Nome));
				eModeloMoto.setCodigoMarcaMoto(Integer.valueOf(rs
						.getString(EntidadeModeloMoto.NM_COL_CodigoMarcaMoto)));
				eModeloMoto.setCilindrada(rs
						.getString(EntidadeModeloMoto.NM_COL_Cilindrada));
			}

		} catch (SQLException e) {
			System.out.println("Erro ao consultar em " + NM_ENTIDADE);
		}

		return eModeloMoto;
	}

	public static ArrayList<EntidadeModeloMoto> consultarPorCilindrada(
			String cilindrada) {

		String sql = "SELECT * FROM " + EntidadeModeloMoto.NM_TABELA
				+ " WHERE " + EntidadeModeloMoto.NM_COL_Cilindrada + " = '"
				+ cilindrada + "'";
		ArrayList<EntidadeModeloMoto> listaRetorno = new ArrayList<EntidadeModeloMoto>();
		PreparedStatement stmt = getPreparedStatement(sql);

		try {
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				EntidadeModeloMoto eModeloMoto = new EntidadeModeloMoto();
				eModeloMoto
						.setCodigoModeloMoto(Integer.valueOf(rs
								.getString(EntidadeModeloMoto.NM_COL_CodigoModeloMoto)));
				eModeloMoto.setNome(rs
						.getString(EntidadeModeloMoto.NM_COL_Nome));
				eModeloMoto.setCodigoMarcaMoto(Integer.valueOf(rs
						.getString(EntidadeModeloMoto.NM_COL_CodigoMarcaMoto)));
				eModeloMoto.setCilindrada(rs
						.getString(EntidadeModeloMoto.NM_COL_Cilindrada));

				listaRetorno.add(eModeloMoto);
			}

		} catch (SQLException e) {
			System.out.println("Erro ao consultar em " + NM_ENTIDADE);
		}

		return listaRetorno;
	}

}

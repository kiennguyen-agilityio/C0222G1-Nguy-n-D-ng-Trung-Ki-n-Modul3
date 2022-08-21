package repository.contract;

import model.Contract;
import model.ContractDetail;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class ContractRepositoryImpl implements IContractRepository{
    private static final String INSERT_CONTRACT ="INSERT INTO contract (contract_start_date, contract_end_date, " +
            "contract_deposit, contract_total_money, employee_id, customer_id, service_id)\n" +
            "VALUES (?, ?, ?, ?, ?, ?, ?);";
    private static final String INSERT_CONTRACT_DETAIL = "INSERT INTO contract_detail(contract_id, attach_service_id, quantity)\n" +
            "VALUES (?, ?, ?);";

    @Override
    public void insertContract(Contract contract) throws SQLException {
        System.out.println(INSERT_CONTRACT);
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CONTRACT)) {
            preparedStatement.setString(1, contract.getStartDate());
            preparedStatement.setString(2, contract.getEndDate());
            preparedStatement.setDouble(3, contract.getDeposit());
            preparedStatement.setDouble(4, contract.getTotalMoney());
            preparedStatement.setInt(5, contract.getEmployeeId());
            preparedStatement.setString(6, contract.getCustomerId());
            preparedStatement.setString(7, contract.getServiceId());

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertContractDetail(ContractDetail contractDetail) throws SQLException {
        System.out.println(INSERT_CONTRACT_DETAIL);
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CONTRACT_DETAIL)) {
            preparedStatement.setInt(1, contractDetail.getContractId());
            preparedStatement.setInt(2, contractDetail.getAttachServiceId());
            preparedStatement.setInt(3, contractDetail.getQuantity());

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Contract selectContract(int id) {
        return null;
    }

    @Override
    public List<Contract> selectAllContract() {
        return null;
    }
}

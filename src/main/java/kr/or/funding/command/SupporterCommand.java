package kr.or.funding.command;

import java.util.List;

import kr.or.funding.dto.RewardItemVO;
import kr.or.funding.dto.SaleLogVO;

public class SupporterCommand extends SaleLogVO{
	private List<RewardItemVO> ritems;
	public List<RewardItemVO> getRitems() {
		return ritems;
	}
	public void setRitems(List<RewardItemVO> ritems) {
		this.ritems = ritems;
	}
}

package com.agencyapp.service.impl;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agencyapp.dao.iam.User2Dao;
import com.agencyapp.dao.messaging.ConversationsDao;
import com.agencyapp.dao.messaging.MessagesDao;
import com.agencyapp.dao.messaging.ParticipantsDao;
import com.agencyapp.dto.messaging.ParticipantDTO;
import com.agencyapp.model.GoogleDriveFileDTO;
import com.agencyapp.model.iam.UsersEntity;
import com.agencyapp.model.messaging.ConversationsEntity;
import com.agencyapp.model.messaging.MessagesEntity;
import com.agencyapp.model.messaging.ParticipantsEntity;
import com.agencyapp.service.IGoogleDriveFile;
import com.agencyapp.service.IParticipantsService;
import com.agencyapp.service.IPropertiesService;

@Service
public class ParticipantsServiceImpl implements IParticipantsService {
	private final String URL_PREFIX = "https://drive.google.com/uc?id=";
	@Autowired
	private ParticipantsDao participantsDao;
	@Autowired
	private ConversationsDao conversationsDao;
	@Autowired
	private User2Dao userDao;
	@Autowired
	private MessagesDao messagesDao;
	@Autowired
	private IGoogleDriveFile iGoogleDriveFile;
	@Autowired
	private IPropertiesService iPropertiesService;

	@Override
	public boolean deleteParticipantsByUserID(int userId) {
		List<ParticipantsEntity> participantsEntityList = participantsDao.findByUserId(userId);
		if (participantsEntityList.size() > 0) {
			for (ParticipantsEntity p : participantsEntityList) {
				participantsDao.deleteById(p.getId());
			}

			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<ParticipantsEntity> findByUserId(int userId) {
		return participantsDao.findByUserId(userId);
	}

	@Override
	public List<ParticipantDTO> getParticipantByUserLogin(int userId) {
		List<ParticipantsEntity> parEntity = new ArrayList<>();
		List<UsersEntity> allUser = userDao.findAll();
		List<Integer> userSender = new ArrayList<>();
		List<Integer> conversationId = new ArrayList<>();
		;
		for (int i = 0; i < allUser.size(); i++) {
			Integer conversationIdOfTwo = iPropertiesService.getConversation_id(userId, allUser.get(i).getId());
			if (conversationIdOfTwo != null)
				conversationId.add(conversationIdOfTwo);
		}

		for (int i = 0; i < conversationId.size(); i++) {
			Optional<ConversationsEntity> conversationsEntity = conversationsDao.findById(conversationId.get(i));

			parEntity.add(participantsDao.findByConversation_id(conversationId.get(i)));
			if (conversationsEntity.get().getCreator_id() != userId) {
				userSender.add(conversationsEntity.get().getCreator_id());
			} else {
				userSender.add(parEntity.get(i).getUserId());
			}
		}
		return converToDTO(parEntity, userSender);
	}

	public List<ParticipantDTO> converToDTO(List<ParticipantsEntity> parEntity, List<Integer> userSender) {
		List<ParticipantDTO> listDTO = new ArrayList<>();
		for (int i = 0; i < parEntity.size(); i++) {
			ParticipantDTO parDTO = new ParticipantDTO();
			UsersEntity userEntity = userDao.findByid(userSender.get(i));
			MessagesEntity messageEntity = messagesDao.getLastMessageOfConver(parEntity.get(i).getConversation_id());
			if (messageEntity != null) {
				parDTO.setId(parEntity.get(i).getId());
				parDTO.setUserName(userEntity.getUsername());
				parDTO.setLastMessage(messageEntity.getMessage());
				parDTO.setStatus(messageEntity.getStatus());
				parDTO.setCreated(messageEntity.getCreated());
				parDTO.setConversation_id(parEntity.get(i).getConversation_id());
				try {
					parDTO.setPicUser(URL_PREFIX + getIdImageByNameImage(userEntity.getPic_user()));
				} catch (IOException e) {
					e.printStackTrace();
				} catch (GeneralSecurityException e) {
					e.printStackTrace();
				}
				listDTO.add(parDTO);
			}
		}
		return listDTO;
	}

	public String getIdImageByNameImage(String imageName) throws IOException, GeneralSecurityException {
		List<GoogleDriveFileDTO> listFound = iGoogleDriveFile.getAllFile();
		for (int i = 0; i < listFound.size(); i++) {
			if (listFound.get(i).getName().equalsIgnoreCase(imageName)) {
				return listFound.get(i).getId().toString();
			}
		}
		return "";
	}
}

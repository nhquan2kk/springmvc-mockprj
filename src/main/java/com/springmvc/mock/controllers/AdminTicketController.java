package com.springmvc.mock.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.mock.models.Ticket;
import com.springmvc.mock.services.AdminSeatService;
import com.springmvc.mock.services.AdminShowtimeService;
import com.springmvc.mock.services.AdminTicketService;

@Controller
@RequestMapping("/tickets")
public class AdminTicketController {

	@Autowired
	private AdminTicketService adminTicketService;
	
	@Autowired
	private AdminSeatService adminSeatService;
	
	@Autowired
	private AdminShowtimeService adminShowtimeService;
	
	@GetMapping
	public String listTicket(Model model) {
		model.addAttribute("tickets", adminTicketService.getAllTicket());
		model.addAttribute("seats", adminSeatService.getAllSeat());
		return "listTicket";
	}
	
	@GetMapping("/create")
	public String createTicketForm(Model model) {
		model.addAttribute("seats", adminSeatService.getAllSeat());
		return "adminCreateTicket";
	}
	
	@PostMapping("/createticket")
	public String createTicket(
			@RequestParam("id") Long id,
			@RequestParam("showtime.id") Long showtimeId,
			@RequestParam("ticket_type") String ticket_type,
			@RequestParam("price") Double price,
			@RequestParam("seat.id") Long seatId
			) {
		Ticket ticket = new Ticket();
		ticket.setId(id);
		ticket.setShowtime(adminShowtimeService.getShowtimeById(showtimeId));
		ticket.setTicket_type(ticket_type);
		ticket.setPrice(price);
		ticket.setSeat(adminSeatService.getSeatById(seatId));
		return "redirect:/tickets";
	}
	
	@PostMapping("/update")
	public String updateTicket(
			@RequestParam("id") Long id,
			@RequestParam("showtime.id") Long showtimeId,
			@RequestParam("ticket_type") String ticket_type,
			@RequestParam("price") Double price,
			@RequestParam("seat.id") Long seatId
			) {
		Ticket ticket = new Ticket();
		if(ticket != null) {
			ticket.setId(id);
			ticket.setShowtime(adminShowtimeService.getShowtimeById(showtimeId));
			ticket.setTicket_type(ticket_type);
			ticket.setPrice(price);
			ticket.setSeat(adminSeatService.getSeatById(seatId));
			adminTicketService.saveTicket(ticket);
		}
		return "redirect:/tickets";
	}
	
	@PostMapping("/detele")
	public String deleteTicket(@RequestParam("id") Long id) {
		adminTicketService.deleteTicket(id);
		return "redirect:/tickets";
	}
}
	